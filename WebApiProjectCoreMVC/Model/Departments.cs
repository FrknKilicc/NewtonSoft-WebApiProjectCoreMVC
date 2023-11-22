using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebApiProjectCoreMVC.Model
{
    public class Departments
    {
        [Key]
        public int DepartmentID { get; set; }
        public string DepartmentName { get; set; }
        [ForeignKey("universities")]
        public int UniversityID { get; set; }
        public Universities universities { get; set; }
    }
}
