using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebApiProjectCoreMVC.Model
{
    public class Students
    {
        [Key]
        public int StudentID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        [ForeignKey("departments")]
        public int DepartmentID { get; set; }
        public DateTime EnrollmentYear { get; set; }
        public Departments departments { get; set; }   

    }
}
