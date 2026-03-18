use school_app;

-- 1. Thêm Roles (Quyền hạn)
INSERT INTO roles (role_name) VALUES
                                  ('ROLE_STUDENT'),
                                  ('ROLE_PARENT'),
                                  ('ROLE_TEACHER');

-- 2. Thêm Users (Tài khoản đăng nhập)
-- Mật khẩu đã được mã hóa BCrypt cho chuỗi "123456"
INSERT INTO users (phone, password, enabled) VALUES
                                                 ('0344276687', '$2a$10$ZDpewDSy08RsvHk0NIeAu./jrSBbrERgfEFdOMbzJfgJF4eC34VLm', true), -- Tài khoản Học sinh
                                                 ('0909888999', '$2a$12$N9/9K1tH/Wb4Xq/tH/Wb4.QW2O5/Z1QW2O5/Z1QW2O5/Z1QW2O5/Z', true); -- Tài khoản Phụ huynh

-- 3. Cấp quyền cho Users
INSERT INTO user_roles (user_id, role_id) VALUES
                                              (1, 1), -- User 1 là STUDENT
                                              (2, 2); -- User 2 là PARENT

-- 4. Thêm Hồ sơ Học sinh (Khớp với màn hình Hồ sơ cá nhân)
INSERT INTO students (student_id, user_id, full_name, class_name, dob, email, academic_year, avatar_url)
VALUES ('HS252612A1001', 1, 'Nguyễn Văn A', '12A1', '2008-05-15', 'vanna@gmail.com', '2025-2026', 'https://i.pravatar.cc/150?u=a042581f4e29026704d');

-- 5. Thêm Hồ sơ Phụ huynh & Nối Phụ huynh với Học sinh
INSERT INTO parents (user_id, full_name) VALUES (2, 'Nguyễn Văn B');
INSERT INTO parent_students (parent_id, student_id) VALUES (1, 'HS252612A1001');

INSERT INTO grades (student_id, semester, subject, teacher_name, score15m, score45m, score_final, score_avg)
VALUES
-- Học kì 1 (Đã hoàn tất)
('HS252612A1001', 'Học kì 1', 'Toán', 'Thầy Trần Văn B', '8.5, 9.0', '9.0, 9.5', 9.2, 9.1),
('HS252612A1001', 'Học kì 1', 'Vật Lý', 'Cô Nguyễn Thị C', '9.0, 9.5', '8.5, 9.0', 9.0, 9.0),
('HS252612A1001', 'Học kì 1', 'Hóa Học', 'Thầy Lê Văn D', '8.0, 8.5', '9.5, 9.0', 9.5, 9.1),
('HS252612A1001', 'Học kì 1', 'Sinh Học', 'Cô Phạm Thị E', '7.5, 8.0', '8.5', 8.0, 8.1),
('HS252612A1001', 'Học kì 1', 'Ngữ Văn', 'Cô Hoàng Thị F', '7.0, 7.5', '7.0, 7.5', 7.5, 7.3),
('HS252612A1001', 'Học kì 1', 'Tiếng Anh', 'Thầy Vũ Văn G', '8.0, 8.5', '8.5, 9.0', 8.5, 8.5),
('HS252612A1001', 'Học kì 1', 'Tin Học', 'Thầy Phạm Văn H', '9.0, 9.5', '9.5', 10.0, 9.5),

-- Học kì 2 (Mới bắt đầu, dữ liệu dang dở)
('HS252612A1001', 'Học kì 2', 'Toán', 'Thầy Trần Văn B', '9.5', '9.0', NULL, NULL),
('HS252612A1001', 'Học kì 2', 'Vật Lý', 'Cô Nguyễn Thị C', '9.0', NULL, NULL, NULL),
('HS252612A1001', 'Học kì 2', 'Hóa Học', 'Thầy Lê Văn D', '8.5', '9.0', NULL, NULL),
('HS252612A1001', 'Học kì 2', 'Ngữ Văn', 'Cô Hoàng Thị F', '7.5', NULL, NULL, NULL);

INSERT INTO schedules (class_name, week_name, study_date, period, subject, teacher_name, room, time_range)
VALUES
-- ============== TUẦN 23 (16/02/2026 - 20/02/2026) ==============
-- Thứ 2 (16/02)
('12A1', 'Tuần 23', '2026-02-16', 1, 'Chào cờ', 'Ban Giám Hiệu', 'Sân trường', '07:00 - 07:45'),
('12A1', 'Tuần 23', '2026-02-16', 2, 'Toán', 'Thầy Trần Văn B', 'Phòng 301', '07:50 - 08:35'),
('12A1', 'Tuần 23', '2026-02-16', 3, 'Toán', 'Thầy Trần Văn B', 'Phòng 301', '08:55 - 09:40'),
('12A1', 'Tuần 23', '2026-02-16', 4, 'Vật Lý', 'Cô Nguyễn Thị C', 'Phòng 301', '09:45 - 10:30'),
('12A1', 'Tuần 23', '2026-02-16', 5, 'Vật Lý', 'Cô Nguyễn Thị C', 'Phòng 301', '10:35 - 11:20'),
-- Thứ 3 (17/02)
('12A1', 'Tuần 23', '2026-02-17', 1, 'Hóa Học', 'Thầy Lê Văn D', 'Phòng 301', '07:00 - 07:45'),
('12A1', 'Tuần 23', '2026-02-17', 2, 'Hóa Học', 'Thầy Lê Văn D', 'Phòng 301', '07:50 - 08:35'),
('12A1', 'Tuần 23', '2026-02-17', 3, 'Sinh Học', 'Cô Phạm Thị E', 'Phòng 301', '08:55 - 09:40'),
('12A1', 'Tuần 23', '2026-02-17', 4, 'Tiếng Anh', 'Thầy Vũ Văn G', 'Phòng 301', '09:45 - 10:30'),
('12A1', 'Tuần 23', '2026-02-17', 5, 'Tiếng Anh', 'Thầy Vũ Văn G', 'Phòng 301', '10:35 - 11:20'),
-- Thứ 4 (18/02)
('12A1', 'Tuần 23', '2026-02-18', 1, 'Ngữ Văn', 'Cô Hoàng Thị F', 'Phòng 301', '07:00 - 07:45'),
('12A1', 'Tuần 23', '2026-02-18', 2, 'Ngữ Văn', 'Cô Hoàng Thị F', 'Phòng 301', '07:50 - 08:35'),
('12A1', 'Tuần 23', '2026-02-18', 3, 'Toán', 'Thầy Trần Văn B', 'Phòng 301', '08:55 - 09:40'),
('12A1', 'Tuần 23', '2026-02-18', 4, 'Tin Học', 'Thầy Phạm Văn H', 'Phòng Máy 1', '09:45 - 10:30'),
('12A1', 'Tuần 23', '2026-02-18', 5, 'GDCD', 'Cô Lê Thị K', 'Phòng 301', '10:35 - 11:20'),
-- Thứ 5 (19/02)
('12A1', 'Tuần 23', '2026-02-19', 1, 'Vật Lý', 'Cô Nguyễn Thị C', 'Phòng 301', '07:00 - 07:45'),
('12A1', 'Tuần 23', '2026-02-19', 2, 'Hóa Học', 'Thầy Lê Văn D', 'Phòng 301', '07:50 - 08:35'),
('12A1', 'Tuần 23', '2026-02-19', 3, 'Thể Dục', 'Thầy Nguyễn Văn M', 'Sân Thể Chất', '08:55 - 09:40'),
('12A1', 'Tuần 23', '2026-02-19', 4, 'Lịch Sử', 'Cô Trần Thị N', 'Phòng 301', '09:45 - 10:30'),
('12A1', 'Tuần 23', '2026-02-19', 5, 'Địa Lý', 'Thầy Lê Văn P', 'Phòng 301', '10:35 - 11:20'),
-- Thứ 6 (20/02)
('12A1', 'Tuần 23', '2026-02-20', 1, 'Toán', 'Thầy Trần Văn B', 'Phòng 301', '07:00 - 07:45'),
('12A1', 'Tuần 23', '2026-02-20', 2, 'Ngữ Văn', 'Cô Hoàng Thị F', 'Phòng 301', '07:50 - 08:35'),
('12A1', 'Tuần 23', '2026-02-20', 3, 'Sinh Học', 'Cô Phạm Thị E', 'Phòng 301', '08:55 - 09:40'),
('12A1', 'Tuần 23', '2026-02-20', 4, 'Tiếng Anh', 'Thầy Vũ Văn G', 'Phòng 301', '09:45 - 10:30'),
('12A1', 'Tuần 23', '2026-02-20', 5, 'Sinh Hoạt', 'Thầy Trần Văn B', 'Phòng 301', '10:35 - 11:20'),

-- ============== TUẦN 24 (23/02/2026 - 27/02/2026) ==============
('12A1', 'Tuần 24', '2026-02-23', 1, 'Chào cờ', 'Ban Giám Hiệu', 'Sân trường', '07:00 - 07:45'),
('12A1', 'Tuần 24', '2026-02-23', 2, 'Toán', 'Thầy Trần Văn B', 'Phòng 301', '07:50 - 08:35'),
('12A1', 'Tuần 24', '2026-02-23', 3, 'Toán', 'Thầy Trần Văn B', 'Phòng 301', '08:55 - 09:40'),
('12A1', 'Tuần 24', '2026-02-23', 4, 'Vật Lý', 'Cô Nguyễn Thị C', 'Phòng 301', '09:45 - 10:30'),
('12A1', 'Tuần 24', '2026-02-23', 5, 'Vật Lý', 'Cô Nguyễn Thị C', 'Phòng 301', '10:35 - 11:20'),
('12A1', 'Tuần 24', '2026-02-24', 1, 'Hóa Học', 'Thầy Lê Văn D', 'Phòng 301', '07:00 - 07:45'),
('12A1', 'Tuần 24', '2026-02-24', 2, 'Hóa Học', 'Thầy Lê Văn D', 'Phòng 301', '07:50 - 08:35'),
('12A1', 'Tuần 24', '2026-02-24', 3, 'Sinh Học', 'Cô Phạm Thị E', 'Phòng 301', '08:55 - 09:40'),
('12A1', 'Tuần 24', '2026-02-24', 4, 'Tiếng Anh', 'Thầy Vũ Văn G', 'Phòng 301', '09:45 - 10:30'),
('12A1', 'Tuần 24', '2026-02-24', 5, 'Tiếng Anh', 'Thầy Vũ Văn G', 'Phòng 301', '10:35 - 11:20'),
('12A1', 'Tuần 24', '2026-02-25', 1, 'Ngữ Văn', 'Cô Hoàng Thị F', 'Phòng 301', '07:00 - 07:45'),
('12A1', 'Tuần 24', '2026-02-25', 2, 'Ngữ Văn', 'Cô Hoàng Thị F', 'Phòng 301', '07:50 - 08:35'),
('12A1', 'Tuần 24', '2026-02-25', 3, 'Toán', 'Thầy Trần Văn B', 'Phòng 301', '08:55 - 09:40'),
('12A1', 'Tuần 24', '2026-02-25', 4, 'Tin Học', 'Thầy Phạm Văn H', 'Phòng Máy 1', '09:45 - 10:30'),
('12A1', 'Tuần 24', '2026-02-25', 5, 'GDCD', 'Cô Lê Thị K', 'Phòng 301', '10:35 - 11:20'),
('12A1', 'Tuần 24', '2026-02-26', 1, 'Vật Lý', 'Cô Nguyễn Thị C', 'Phòng 301', '07:00 - 07:45'),
('12A1', 'Tuần 24', '2026-02-26', 2, 'Hóa Học', 'Thầy Lê Văn D', 'Phòng 301', '07:50 - 08:35'),
('12A1', 'Tuần 24', '2026-02-26', 3, 'Thể Dục', 'Thầy Nguyễn Văn M', 'Sân Thể Chất', '08:55 - 09:40'),
('12A1', 'Tuần 24', '2026-02-26', 4, 'Lịch Sử', 'Cô Trần Thị N', 'Phòng 301', '09:45 - 10:30'),
('12A1', 'Tuần 24', '2026-02-26', 5, 'Địa Lý', 'Thầy Lê Văn P', 'Phòng 301', '10:35 - 11:20'),
('12A1', 'Tuần 24', '2026-02-27', 1, 'Toán', 'Thầy Trần Văn B', 'Phòng 301', '07:00 - 07:45'),
('12A1', 'Tuần 24', '2026-02-27', 2, 'Ngữ Văn', 'Cô Hoàng Thị F', 'Phòng 301', '07:50 - 08:35'),
('12A1', 'Tuần 24', '2026-02-27', 3, 'Sinh Học', 'Cô Phạm Thị E', 'Phòng 301', '08:55 - 09:40'),
('12A1', 'Tuần 24', '2026-02-27', 4, 'Tiếng Anh', 'Thầy Vũ Văn G', 'Phòng 301', '09:45 - 10:30'),
('12A1', 'Tuần 24', '2026-02-27', 5, 'Sinh Hoạt', 'Thầy Trần Văn B', 'Phòng 301', '10:35 - 11:20'),

-- ============== TUẦN 25 (02/03/2026 - 06/03/2026) ==============
('12A1', 'Tuần 25', '2026-03-02', 1, 'Chào cờ', 'Ban Giám Hiệu', 'Sân trường', '07:00 - 07:45'),
('12A1', 'Tuần 25', '2026-03-02', 2, 'Toán', 'Thầy Trần Văn B', 'Phòng 301', '07:50 - 08:35'),
('12A1', 'Tuần 25', '2026-03-02', 3, 'Toán', 'Thầy Trần Văn B', 'Phòng 301', '08:55 - 09:40'),
('12A1', 'Tuần 25', '2026-03-02', 4, 'Vật Lý', 'Cô Nguyễn Thị C', 'Phòng 301', '09:45 - 10:30'),
('12A1', 'Tuần 25', '2026-03-02', 5, 'Vật Lý', 'Cô Nguyễn Thị C', 'Phòng 301', '10:35 - 11:20'),
('12A1', 'Tuần 25', '2026-03-03', 1, 'Hóa Học', 'Thầy Lê Văn D', 'Phòng 301', '07:00 - 07:45'),
('12A1', 'Tuần 25', '2026-03-03', 2, 'Hóa Học', 'Thầy Lê Văn D', 'Phòng 301', '07:50 - 08:35'),
('12A1', 'Tuần 25', '2026-03-03', 3, 'Sinh Học', 'Cô Phạm Thị E', 'Phòng 301', '08:55 - 09:40'),
('12A1', 'Tuần 25', '2026-03-03', 4, 'Tiếng Anh', 'Thầy Vũ Văn G', 'Phòng 301', '09:45 - 10:30'),
('12A1', 'Tuần 25', '2026-03-03', 5, 'Tiếng Anh', 'Thầy Vũ Văn G', 'Phòng 301', '10:35 - 11:20'),
('12A1', 'Tuần 25', '2026-03-04', 1, 'Ngữ Văn', 'Cô Hoàng Thị F', 'Phòng 301', '07:00 - 07:45'),
('12A1', 'Tuần 25', '2026-03-04', 2, 'Ngữ Văn', 'Cô Hoàng Thị F', 'Phòng 301', '07:50 - 08:35'),
('12A1', 'Tuần 25', '2026-03-04', 3, 'Toán', 'Thầy Trần Văn B', 'Phòng 301', '08:55 - 09:40'),
('12A1', 'Tuần 25', '2026-03-04', 4, 'Tin Học', 'Thầy Phạm Văn H', 'Phòng Máy 1', '09:45 - 10:30'),
('12A1', 'Tuần 25', '2026-03-04', 5, 'GDCD', 'Cô Lê Thị K', 'Phòng 301', '10:35 - 11:20'),
('12A1', 'Tuần 25', '2026-03-05', 1, 'Vật Lý', 'Cô Nguyễn Thị C', 'Phòng 301', '07:00 - 07:45'),
('12A1', 'Tuần 25', '2026-03-05', 2, 'Hóa Học', 'Thầy Lê Văn D', 'Phòng 301', '07:50 - 08:35'),
('12A1', 'Tuần 25', '2026-03-05', 3, 'Thể Dục', 'Thầy Nguyễn Văn M', 'Sân Thể Chất', '08:55 - 09:40'),
('12A1', 'Tuần 25', '2026-03-05', 4, 'Lịch Sử', 'Cô Trần Thị N', 'Phòng 301', '09:45 - 10:30'),
('12A1', 'Tuần 25', '2026-03-05', 5, 'Địa Lý', 'Thầy Lê Văn P', 'Phòng 301', '10:35 - 11:20'),
('12A1', 'Tuần 25', '2026-03-06', 1, 'Toán', 'Thầy Trần Văn B', 'Phòng 301', '07:00 - 07:45'),
('12A1', 'Tuần 25', '2026-03-06', 2, 'Ngữ Văn', 'Cô Hoàng Thị F', 'Phòng 301', '07:50 - 08:35'),
('12A1', 'Tuần 25', '2026-03-06', 3, 'Sinh Học', 'Cô Phạm Thị E', 'Phòng 301', '08:55 - 09:40'),
('12A1', 'Tuần 25', '2026-03-06', 4, 'Tiếng Anh', 'Thầy Vũ Văn G', 'Phòng 301', '09:45 - 10:30'),
('12A1', 'Tuần 25', '2026-03-06', 5, 'Sinh Hoạt', 'Thầy Trần Văn B', 'Phòng 301', '10:35 - 11:20');

INSERT INTO exam_schedules (student_id, semester, subject, exam_date_time, room, duration_minutes)
VALUES
    ('HS252612A1001', 'Học kì 2', 'Toán', '2026-03-20 07:30:00', 'Phòng Thi 05', 90),
    ('HS252612A1001', 'Học kì 2', 'Ngữ Văn', '2026-03-20 09:30:00', 'Phòng Thi 05', 120),
    ('HS252612A1001', 'Học kì 2', 'Vật Lý', '2026-03-21 07:30:00', 'Phòng Thi 05', 50),
    ('HS252612A1001', 'Học kì 2', 'Hóa Học', '2026-03-21 08:45:00', 'Phòng Thi 05', 50),
    ('HS252612A1001', 'Học kì 2', 'Tiếng Anh', '2026-03-21 10:00:00', 'Phòng Thi 05', 60);

INSERT INTO attendances (student_id, attendance_date, status, note)
VALUES
-- Tuần 23
('HS252612A1001', '2026-02-16', 'Có mặt', 'Đúng giờ'),
('HS252612A1001', '2026-02-17', 'Có mặt', 'Đúng giờ'),
('HS252612A1001', '2026-02-18', 'Có mặt', 'Đúng giờ'),
('HS252612A1001', '2026-02-19', 'Nghỉ có phép', 'Sốt siêu vi (Phụ huynh đã xin phép)'),
('HS252612A1001', '2026-02-20', 'Có mặt', 'Đúng giờ'),

-- Tuần 24
('HS252612A1001', '2026-02-23', 'Có mặt', 'Đúng giờ'),
('HS252612A1001', '2026-02-24', 'Có mặt', 'Đúng giờ'),
('HS252612A1001', '2026-02-25', 'Có mặt', 'Đúng giờ'),
('HS252612A1001', '2026-02-26', 'Có mặt', 'Đúng giờ'),
('HS252612A1001', '2026-02-27', 'Có mặt', 'Đúng giờ'),

-- Tuần 25
('HS252612A1001', '2026-03-02', 'Có mặt', 'Đúng giờ'),
('HS252612A1001', '2026-03-03', 'Có mặt', 'Đúng giờ'),
('HS252612A1001', '2026-03-04', 'Có mặt', 'Đúng giờ'),
('HS252612A1001', '2026-03-05', 'Có mặt', 'Đúng giờ'),
('HS252612A1001', '2026-03-06', 'Có mặt', 'Đúng giờ');

INSERT INTO notifications (student_id, type, title, content, created_at)
VALUES
    (NULL, 'HỆ THỐNG', 'Cập nhật thời khóa biểu Tuần 23', 'Nhà trường thông báo thời khóa biểu mới áp dụng từ ngày 16/02/2026. Các em học sinh chú ý theo dõi.', '2026-02-14 08:00:00'),
    ('HS252612A1001', 'HỌC TẬP', 'Nhắc nhở điểm danh', 'Em đã vắng mặt có phép vào ngày 19/02/2026. Vui lòng mượn vở bạn để chép bài đầy đủ.', '2026-02-19 14:30:00'),
    (NULL, 'SỰ KIỆN', 'Kế hoạch thi Giữa kì 2 khối 12', 'Kỳ thi Giữa học kì 2 sẽ diễn ra từ ngày 20/03 đến 22/03/2026. Lịch thi chi tiết đã được cập nhật trên hệ thống.', '2026-03-01 09:15:00'),
    ('HS252612A1001', 'HỌC TẬP', 'Cập nhật điểm số môn Toán', 'Thầy Trần Văn B vừa cập nhật điểm kiểm tra 15 phút môn Toán (Điểm: 9.5).', '2026-03-05 10:20:00');