using System.ComponentModel.DataAnnotations;

namespace WebApiProjectCoreMVC.Model
{
    public class Universities
    {
        [Key]
        public int UniversityID { get; set; }
        public string UniversityName { get; set; }
        public string Location { get; set; }
    }
}
