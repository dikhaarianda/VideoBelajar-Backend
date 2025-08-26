USE `educourse_db`;

INSERT INTO `courses` (id, title, description, topic, instructor, price)
VALUES
  (UUID(), 'JavaScript 101', 'Dasar JavaScript modern untuk pemula.', 'programming', 'Jane Doe', 199000.00),
  (UUID(), 'Node.js API Mastery', 'Bangun REST API dengan Express & Sequelize.', 'programming', 'John Smith', 299000.00),
  (UUID(), 'UI/UX Fundamentals', 'Prinsip desain UI/UX.', 'design', 'Alice', 249000.00),
  (UUID(), 'Data Analysis with Python', 'Pandas, NumPy, Matplotlib.', 'data', 'Bob', 349000.00),
  (UUID(), 'Digital Marketing Basics', 'SEO, SEM, social media.', 'marketing', 'Carol', 179000.00),
  (UUID(), 'Advanced SQL', 'Query kompleks, indexing, tuning.', 'database', 'Dave', 219000.00);