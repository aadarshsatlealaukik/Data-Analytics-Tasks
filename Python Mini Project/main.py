
import pandas as pd
import numpy as np
import os

stu = pd.read_csv("student.csv")
stu.columns = stu.columns.str.strip()

subject_columns = [
    "English",
    "Maths",
    "Science",
    "Social_Science",
    "Computer"
]

stu[subject_columns] = stu[subject_columns].apply(
    pd.to_numeric, errors="coerce"
)

stu["Total"] = stu[subject_columns].sum(axis=1, min_count=1)
stu["Percentage"] = (stu["Total"] / 500) * 100


def show_welcome(stu):
    print("=" * 50)
    print("        STUDENT MARKS ANALYSIS SYSTEM")
    print("=" * 50)

    print("\nGood morning, Teacher!")
    print("Welcome to the classroom.")
    print("\nStudents: Good morning, Sir!")
    print(f"\nToday's count is: {len(stu)} students")


def show_class_counts(stu):
    print("\nSTUDENT COUNTS FOR ALL CLASSES\n")
    print(stu["Class"].value_counts().sort_index())


def show_roster(stu, class_name):
    class_students = stu[stu["Class"] == class_name]

    print(f"\n====== CLASS {class_name}: STUDENT ROSTER ======\n")

    if class_students.empty:
        print("No students found in this class.")
        return

    for serial_no, (_, student) in enumerate(
        class_students.iterrows(), start=1
    ):
        print(
            f"{serial_no}. "
            f"{student['Student_ID']} - {student['Name']}"
        )

    print(f"\nTotal students in Class {class_name}: {len(class_students)}")


def show_results(stu, class_name):
    class_students = stu[stu["Class"] == class_name]

    print(
        f"\n====== CLASS {class_name} STUDENT MARKS ANALYSIS ======\n"
    )

    if class_students.empty:
        print(f"No students found in Class {class_name}.")
        return

    print(
        class_students[
            ["Student_ID", "Name", "Total", "Percentage"]
        ].to_string(index=False)
    )

    print("\nVALIDATION")
    print("Total Students:", len(class_students))
    print("Minimum Total:", class_students["Total"].min())
    print("Maximum Total:", class_students["Total"].max())
    print("Minimum Percentage:", class_students["Percentage"].min())
    print("Maximum Percentage:", class_students["Percentage"].max())


def show_topper(stu, class_name):
    class_students = stu[stu["Class"] == class_name].dropna(
        subset=["Total"]
    )

    if class_students.empty:
        print(f"\nNo valid marks found for Class {class_name}.")
        return

    topper_index = class_students["Total"].idxmax()
    topper = class_students.loc[topper_index]

    print(f"\n====== CLASS {class_name} TOPPER ======")
    print("Student Name :", topper["Name"])
    print("Student ID   :", topper["Student_ID"])
    print("Class        :", topper["Class"])
    print("Total Marks  :", topper["Total"], "/ 500")
    print("Percentage   :", f"{topper['Percentage']:.2f}%")


def show_subject_averages(stu):
    print("\nSUBJECT-WISE AVERAGE MARKS\n")

    for subject in subject_columns:
        average = stu[subject].mean()
        print(f"{subject:<16}: {average:.2f}")


def show_class_subject_averages(stu, class_name):
    class_students = stu[stu["Class"] == class_name]

    if class_students.empty:
        print(f"\nNo students found in Class {class_name}.")
        return

    print(f"\nCLASS {class_name} SUBJECT AVERAGES")
    show_subject_averages(class_students)


def show_pass_fail(stu):
  
    passed = stu[subject_columns].ge(33).all(axis=1)

    pass_count = int(passed.sum())
    fail_count = int((~passed).sum())

    print("\nPASS/FAIL ANALYSIS")
    print("Total Students :", len(stu))
    print("Passed Students:", pass_count)
    print("Failed Students:", fail_count)


def export_class_report(stu):
    os.makedirs("report", exist_ok=True)

    file_path = os.path.join("report", "class_wise_report.xlsx")

    with pd.ExcelWriter(file_path) as writer:
        for class_name in ["10-A", "10-B", "10-C"]:
            class_students = stu[stu["Class"] == class_name]

            class_students.to_excel(
                writer,
                sheet_name=class_name,
                index=False
            )

    print("\nClass-wise report exported successfully!")
    print("File location:", os.path.abspath(file_path))


def export_overall_report(stu):
    os.makedirs("report", exist_ok=True)

    file_path = os.path.join(
        "report", "overall_analysis_report.xlsx"
    )

    passed = stu[subject_columns].ge(33).all(axis=1)

    overall_summary = pd.DataFrame({
        "Metric": [
            "Total Students",
            "Passed Students",
            "Failed Students",
            "Average Total Marks",
            "Average Percentage"
        ],
        "Value": [
            len(stu),
            int(passed.sum()),
            int((~passed).sum()),
            stu["Total"].mean(),
            stu["Percentage"].mean()
        ]
    })

    subject_summary = stu[subject_columns].mean().reset_index()
    subject_summary.columns = ["Subject", "Average Marks"]

    class_counts = (
        stu["Class"].value_counts()
        .sort_index()
        .rename_axis("Class")
        .reset_index(name="Student Count")
    )

    with pd.ExcelWriter(file_path) as writer:
        stu.to_excel(
            writer, sheet_name="All Students", index=False
        )

        overall_summary.to_excel(
            writer, sheet_name="Overall Summary", index=False
        )

        subject_summary.to_excel(
            writer, sheet_name="Subject Averages", index=False
        )

        class_counts.to_excel(
            writer, sheet_name="Class Counts", index=False
        )

    print("\nOverall analysis report exported successfully!")
    print("File location:", os.path.abspath(file_path))


def main():
    show_welcome(stu)

    while True:
        print("\nMAIN MENU")
        print("1. CLASS 10-A Roster and Topper")
        print("2. CLASS 10-B Roster and Topper")
        print("3. CLASS 10-C Roster and Topper")
        print("4. View All Class Counts")
        print("5. Subject-Wise Average Marks")
        print("6. Class-Wise Subject Averages")
        print("7. Pass/Fail Analysis")
        print("8. View Student Results")
        print("9. Export Class-Wise Report")
        print("10. Export Overall Analysis Report")
        print("0. Exit")

        choice = input("\nEnter your choice: ").strip()

        if choice == "1":
            show_roster(stu, "10-A")
            show_topper(stu, "10-A")

        elif choice == "2":
            show_roster(stu, "10-B")
            show_topper(stu, "10-B")

        elif choice == "3":
            show_roster(stu, "10-C")
            show_topper(stu, "10-C")

        elif choice == "4":
            show_class_counts(stu)

        elif choice == "5":
            show_subject_averages(stu)

        elif choice == "6":
            class_name = input(
                "Enter class (10-A, 10-B, or 10-C): "
            ).strip().upper()

            if class_name in ["10-A", "10-B", "10-C"]:
                show_class_subject_averages(stu, class_name)
            else:
                print("Invalid class selection!")

        elif choice == "7":
            show_pass_fail(stu)

        elif choice == "8":
            class_name = input(
                "Enter class (10-A, 10-B, or 10-C): "
            ).strip().upper()

            if class_name in ["10-A", "10-B", "10-C"]:
                show_results(stu, class_name)
            else:
                print("Invalid class selection!")

        elif choice == "9":
            export_class_report(stu)

        elif choice == "10":
            export_overall_report(stu)

        elif choice == "0":
            print("\nThank you, Teacher! Goodbye!")
            break

        else:
            print("Invalid choice. Please select 0 to 10.")


if __name__ == "__main__":
    main()
