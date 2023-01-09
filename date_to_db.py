import faker 
import sqlite3
from datetime import datetime
from random import choice, randint, randrange

NUMBER_STUDENTS = 30
NUMBER_GROUPS = 3
NUMBER_SUBJECTS = 5
NUMBER_TEACHERS = 5
MAX_GRADES_FOR_STUDENT = 10

def generate_fake_data(number_students, number_teachers) -> tuple():
    fake_student_names = []
    fake_teacher_names = []
    fake_student_emails = []
    fake_teacher_emails = []

    fake = faker.Faker()
    
    for _ in range(number_students):
        fake_student_names.append(fake.name())
        fake_student_emails.append(fake.email())

    for _ in range(number_teachers):
        fake_teacher_names.append(fake.name())
        fake_teacher_emails.append(fake.email())

    subject_list = ["english","math","art","science","history"]    
    
    return fake_student_names, fake_student_emails, fake_teacher_names, fake_teacher_emails, subject_list

def prepare_data(student_names, student_emails, teacher_names, teacher_emails, subject_list):
    
    for_students = []
    student_id = 0
    fake = faker.Faker()
    
    for student in student_names:
        student_id += 1
        if student_id <= 10:
            for_students.append((student, student_emails.pop(randrange(len(student_emails))), 1))
        elif student_id > 10 and student_id <= 20:
            for_students.append((student, student_emails.pop(randrange(len(student_emails))), 2))
        else:
            for_students.append((student, student_emails.pop(randrange(len(student_emails))), 3))
            
    for_teachers = []
    
    for teacher in teacher_names:
        for_teachers.append((teacher, teacher_emails.pop(randrange(len(teacher_emails)))))
    
    for_groups = []
    
    for num in range(1, NUMBER_GROUPS+1):
        for_groups.append((f"{num}-{num}", int(NUMBER_STUDENTS/NUMBER_GROUPS)))
    
    for_subjects = []
    
    for num, subject in enumerate(subject_list):
        num += 1
        for_subjects.append((subject, num))
    
    for_grades = []
    
    for student_id in range(1, NUMBER_STUDENTS+1):
        for subject_id in range(1, len(subject_list)+1):
            for grades_num in range(randint(1, MAX_GRADES_FOR_STUDENT)):
                for_grades.append((randint(1, 5), fake.date_between(start_date="-1y", end_date="today"), student_id, subject_id))

    return for_students, for_teachers, for_groups,  for_subjects, for_grades

def insert_data_to_db(students, teachers, groups, subjects, grades):
    
    with sqlite3.connect('my.db') as con:
        cur = con.cursor()
        
        sql_to_groups = """INSERT INTO groups(group_number, number_of_students)
                            VALUES(?, ?)"""

        cur.executemany(sql_to_groups, groups)

        sql_to_teachers = """INSERT INTO teachers(teacher_name, email)
                              VALUES(?, ?)"""

        cur.executemany(sql_to_teachers, teachers)
        
        sql_to_students = """INSERT INTO students(student_name, email, group_id)
                              VALUES(?, ?, ?)"""
        
        cur.executemany(sql_to_students, students)
        
        sql_to_subjects = """INSERT INTO subjects(subject_name, teacher_id)
                              VALUES(?, ?)"""

        cur.executemany(sql_to_subjects, subjects)
        
        sql_to_grades = """INSERT INTO grades(grade, grade_date, student_id, subject_id)
                            VALUES(?, ?, ?, ?)"""
        cur.executemany(sql_to_grades, grades)
        
        con.commit()
        
if __name__ == '__main__':
    fake_data = prepare_data(*generate_fake_data(NUMBER_STUDENTS, NUMBER_TEACHERS))
    insert_data_to_db(*fake_data)