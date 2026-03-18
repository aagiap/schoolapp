package com.schoolapp.service;

import com.schoolapp.dto.AppDTOs;
import com.schoolapp.entity.Role;
import com.schoolapp.entity.Student;
import com.schoolapp.entity.User;
import com.schoolapp.repository.StudentRepository;
import com.schoolapp.repository.UserRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseToken;

@Service
@RequiredArgsConstructor
public class AuthService {
    private final UserRepository userRepo;
    private final StudentRepository studentRepo; // Để lấy thông tin học sinh sau khi login
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;

    public AppDTOs.LoginResponse login(AppDTOs.LoginRequest req) {
        User user = userRepo.findByPhone(req.phone())
                .orElseThrow(() -> new RuntimeException("Số điện thoại không tồn tại"));

        if (!passwordEncoder.matches(req.password(), user.getPassword())) {
            throw new RuntimeException("Mật khẩu không chính xác");
        }

        List<String> roles = user.getRoles().stream()
                .map(Role::getRoleName)
                .toList();

        String token = jwtService.generateToken(user.getPhone(), roles);

        Object profile = null;
        if (roles.contains("ROLE_STUDENT")) {
            profile = studentRepo.findByUser(user).orElse(null);
        }

        return new AppDTOs.LoginResponse(token, roles.get(0), profile);
    }

    public AppDTOs.LoginResponse loginWithFirebase(String firebaseIdToken) {
        try {
            // 1. Nhờ Firebase xác thực Token xem có chuẩn do Google cấp không
            FirebaseToken decodedToken = FirebaseAuth.getInstance().verifyIdToken(firebaseIdToken);
            String phoneFromFirebase = (String) decodedToken.getClaims().get("phone_number");

            if (phoneFromFirebase == null) {
                throw new RuntimeException("Không tìm thấy số điện thoại trong Token");
            }

            // 2. Chuyển đổi +84 thành số 0 ở đầu
            String localPhone = phoneFromFirebase;
            if (localPhone.startsWith("+84")) {
                localPhone = "0" + localPhone.substring(3);
            }

            // 3. Tìm User trong Database
            User user = userRepo.findByPhone(localPhone)
                    .orElseThrow(() -> new RuntimeException("Số điện thoại chưa được đăng ký trong hệ thống Sổ Liên Lạc"));

            // Không cần kiểm tra Password nữa vì OTP là quá đủ an toàn rồi!

            // 4. Lấy Role và tạo JWT y như cũ
            List<String> roles = user.getRoles().stream()
                    .map(Role::getRoleName)
                    .toList();

            String jwtToken = jwtService.generateToken(user.getPhone(), roles);

            Object profile = null;
            if (roles.contains("ROLE_STUDENT")) {
                profile = studentRepo.findByUser(user).orElse(null);
            } else if (roles.contains("ROLE_PARENT")) {
                // Lấy profile Parent nếu cần
            }

            return new AppDTOs.LoginResponse(jwtToken, roles.get(0), profile);

        } catch (Exception e) {
            throw new RuntimeException("Xác thực Firebase thất bại: " + e.getMessage());
        }
    }

    @Transactional
    public void resetPassword(AppDTOs.ResetPasswordRequest req) {
        User user = userRepo.findByPhone(req.phone())
                .orElseThrow(() -> new RuntimeException("Người dùng không tồn tại"));
        user.setPassword(passwordEncoder.encode(req.newPassword()));
        userRepo.save(user);
    }
}