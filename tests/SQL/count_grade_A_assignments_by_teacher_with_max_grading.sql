-- Write query to find the number of grade A's given by the teacher who has graded the most assignments
WITH TeacherGradingCounts AS (
    SELECT teacher_id, COUNT(*) as grading_count,
           COUNT(CASE WHEN grade = 'A' THEN 1 END) as grade_a_count
    FROM assignments
    WHERE state = 'GRADED'
    GROUP BY teacher_id
),
MaxGradingTeacher AS (
    SELECT teacher_id, grade_a_count
    FROM TeacherGradingCounts
    WHERE grading_count = (
        SELECT MAX(grading_count)
        FROM TeacherGradingCounts
    )
    LIMIT 1
)
SELECT grade_a_count
FROM MaxGradingTeacher;