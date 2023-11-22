using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebApiProjectCoreMVC.Model
{
    public class Courses
    {
        [Key]
        public int CourseID { get; set; }
        public string CourseName { get; set; }
        [ForeignKey("departments")]
        public int DepartmentID { get; set; }
        public string InstructorName { get; set; }
        public Departments departments { get; set; }
    }
}
