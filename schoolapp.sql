-- 1. Thêm Roles (Quyền hạn)
INSERT INTO roles (role_name) VALUES 
('ROLE_STUDENT'), 
('ROLE_PARENT'), 
('ROLE_TEACHER');

-- 2. Thêm Users (Tài khoản đăng nhập)
-- Mật khẩu đã được mã hóa BCrypt cho chuỗi "123456"
INSERT INTO users (phone, password, enabled) VALUES
('0901234567', '$2a$12$N9/9K1tH/Wb4Xq/tH/Wb4.QW2O5/Z1QW2O5/Z1QW2O5/Z1QW2O5/Z', true), -- Tài khoản Học sinh
('0909888999', '$2a$12$N9/9K1tH/Wb4Xq/tH/Wb4.QW2O5/Z1QW2O5/Z1QW2O5/Z1QW2O5/Z', true); -- Tài khoản Phụ huynh

-- 3. Cấp quyền cho Users
INSERT INTO user_roles (user_id, role_id) VALUES 
(1, 1), -- User 1 là STUDENT
(2, 2); -- User 2 là PARENT

-- 4. Thêm Hồ sơ Học sinh (Khớp với màn hình Hồ sơ cá nhân)
INSERT INTO students (student_id, user_id, full_name, class_name, dob, email, academic_year, avatar_url)
VALUES ('2022001', 1, 'Nguyễn Văn A', '12A1', '2008-05-15', 'vanna@gmail.com', '2025-2026', 'https://i.pravatar.cc/150?u=a042581f4e29026704d');

-- 5. Thêm Hồ sơ Phụ huynh & Nối Phụ huynh với Học sinh
INSERT INTO parents (user_id, full_name) VALUES (2, 'Nguyễn Văn B');
INSERT INTO parent_students (parent_id, student_id) VALUES (1, '2022001');

-- 6. Thêm Thời khóa biểu (Khớp màn hình Thời khóa biểu - Tuần 12)
INSERT INTO schedules (class_name, week_name, study_date, period, subject, teacher_name, room, time_range) VALUES
('12A1', 'Tuần 12', '2026-03-18', 1, 'Toán học', 'Thầy Nguyễn Văn A', 'Phòng 402 - Tầng 4', '07:30 - 08:15'),
('12A1', 'Tuần 12', '2026-03-18', 2, 'Ngữ Văn', 'Cô Trần Thị B', 'Phòng 402 - Tầng 4', '08:20 - 09:05'),
('12A1', 'Tuần 12', '2026-03-18', 3, 'Vật Lý', 'Thầy Lê Công C', 'Phòng Thí Nghiệm 1', '09:20 - 10:05'),
('12A1', 'Tuần 12', '2026-03-18', 4, 'Hóa Học', 'Cô Hoàng Thị D', 'Phòng Thí Nghiệm 2', '10:10 - 10:55');

-- 7. Thêm Lịch thi (Khớp màn hình Lịch thi học kỳ II)
INSERT INTO exam_schedules (student_id, semester, subject, exam_date_time, room, duration_minutes) VALUES
('2022001', 'Học kỳ II - 2025-2026', 'Toán học', '2026-05-15 08:00:00', 'Phòng 402', 90),
('2022001', 'Học kỳ II - 2025-2026', 'Ngữ văn', '2026-05-16 08:00:00', 'Phòng 105', 120),
('2022001', 'Học kỳ II - 2025-2026', 'Tiếng Anh', '2026-05-18 13:30:00', 'Phòng 301', 60),
('2022001', 'Học kỳ II - 2025-2026', 'Vật lý', '2026-05-19 08:00:00', 'Lab 2', 45),
('2022001', 'Học kỳ II - 2025-2026', 'Hóa học', '2026-05-20 10:00:00', 'Lab 1', 45);

-- 8. Thêm Dữ liệu Bảng Điểm (Khớp màn hình Bảng điểm có điểm 15p, 1 tiết...)
INSERT INTO grades (student_id, semester, subject, teacher_name, score15m, score45m, score_final, score_avg) VALUES
('2022001', 'Học kỳ II - 2025-2026', 'Toán học', 'Nguyễn Văn A', '8.5, 9.0', '8.0, 9.5', 9.5, 9.0),
('2022001', 'Học kỳ II - 2025-2026', 'Ngữ văn', 'Trần Thị B', '7.0, 8.0', '7.5, 8.0', 8.0, 7.8),
('2022001', 'Học kỳ II - 2025-2026', 'Tiếng Anh', 'Lê Văn C', '8.0, 9.0', '8.5, 9.0', 8.5, 8.6),
('2022001', 'Học kỳ II - 2025-2026', 'Vật lý', 'Phạm Văn D', '8.0, 8.5', '7.5, 8.5', 8.5, 8.2),
('2022001', 'Học kỳ II - 2025-2026', 'Hóa học', 'Hoàng Thị E', '8.5, 9.0', '8.0, 8.5', 8.5, 8.5);

-- 9. Thêm Điểm danh (Khớp màn hình báo cáo tháng 5)
-- Lưu ý: Vì Demo chỉ chèn 5 bản ghi nên Tổng số buổi trả về API sẽ là 5 thay vì 88 như UI tĩnh.
INSERT INTO attendances (student_id, attendance_date, status, note) VALUES
('2022001', '2026-05-11', 'Có mặt', 'Đúng giờ'),
('2022001', '2026-05-10', 'Vắng mặt', 'Nghỉ có phép'),
('2022001', '2026-05-09', 'Có mặt', 'Đúng giờ'),
('2022001', '2026-05-08', 'Có mặt', 'Đúng giờ'),
('2022001', '2026-05-07', 'Có mặt', 'Đúng giờ');

-- 10. Thêm Thông báo (Khớp màn hình Thông báo)
-- Dùng khoảng thời gian gần đây (Tháng 3/2026) để sát với thực tế
INSERT INTO notifications (student_id, type, title, content, created_at) VALUES
('2022001', 'HỌC TẬP', 'Kết quả thi thử THPT Quốc gia đợt 1', 'Chúc mừng bạn đã hoàn thành bài thi thử! Điểm trung bình các môn của bạn đạt 8.5. Bạn có thể xem bảng điểm chi tiết và nhận xét của giáo viên trong mục "Kết quả học tập".', '2026-03-16 15:50:00'),
(NULL, 'SỰ KIỆN', 'Thông báo nghỉ lễ Giỗ Tổ Hùng Vương', 'Theo quy định của Nhà trường, học sinh sẽ được nghỉ lễ...', '2026-03-16 14:00:00'),
('2022001', 'NHẮC NHỞ', 'Nhắc nhở hoàn thành bài tập Toán', 'Hạn chót nộp bài tập Hình học chương 3 là 23:59 hôm nay...', '2026-03-15 08:00:00'),
(NULL, 'HỆ THỐNG', 'Cập nhật tính năng mới cho ứng dụng', 'Phiên bản 2.4.0 đã sẵn sàng với nhiều cải tiến hấp dẫn...', '2026-03-14 09:00:00');