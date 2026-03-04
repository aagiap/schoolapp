package com.schoolapp.service;

import com.schoolapp.dto.AppDTOs;
import com.schoolapp.entity.Student;
import com.schoolapp.repository.StudentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuthService {
    private final StudentRepository studentRepo;

    public AppDTOs.StudentDTO login(AppDTOs.LoginRequest req) {
        Student s = studentRepo.findByPhone(req.phone())
                .orElseThrow(() -> new RuntimeException("Tài khoản không tồn tại"));
        if (!s.getPassword().equals(req.password())) {
            throw new RuntimeException("Sai mật khẩu");
        }
        return new AppDTOs.StudentDTO(s.getStudentId(), s.getFullName(), s.getClassName(), s.getPhone(), s.getEmail(), s.getAcademicYear(), s.getDob());
    }

    public void resetPassword(AppDTOs.ResetPasswordRequest req) {
        Student s = studentRepo.findByPhone(req.phone())
                .orElseThrow(() -> new RuntimeException("Số điện thoại chưa được đăng ký"));
        s.setPassword(req.newPassword());
        studentRepo.save(s);
    }
}
