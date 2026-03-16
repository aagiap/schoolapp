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

    @Transactional
    public void resetPassword(AppDTOs.ResetPasswordRequest req) {
        User user = userRepo.findByPhone(req.phone())
                .orElseThrow(() -> new RuntimeException("Người dùng không tồn tại"));
        user.setPassword(passwordEncoder.encode(req.newPassword()));
        userRepo.save(user);
    }
}