using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Colledge519.Pages
{
    /// <summary>
    /// Логика взаимодействия для StudentEditAddPage.xaml
    /// </summary>
    public partial class StudentEditAddPage : Page
    {
        public StudentEditAddPage(Students s)
        {
            InitializeComponent();
            DataContext = this;
            St = s;
            //StudentName = St.Name;
            // StudentSurname = St.Surname;
            AllGroups = Core.BD.Groups.ToList();
        }

        public Students St { get; set; }
        //public string StudentName { get; set; }
        //public string StudentSurname { get; set; }
        public List<Students> check { get; set; }
        public List<Groups> AllGroups { get; set; }


        public void btnSave_Click(object sender, RoutedEventArgs e)
        {
            if (St == null)
            {
                St = new Students();
                St.Surname = tbStSurname.Text;
                St.Name = tbStName.Text;
                //St.Groups.Title = tbGroupTitle.Text;
                //St.Groups.teachers.Surname = tbTeacherSurname.Text;
                var confirmadd = MessageBox.Show("Вы уверены, что хотите добавить пользователя?", "Подтверждение", MessageBoxButton.YesNo, MessageBoxImage.Warning);
                if (confirmadd == MessageBoxResult.Yes)
                {
                    Core.BD.Students.Add(St);
                    Core.BD.SaveChanges();
                    MessageBox.Show("Студент добавлен");
                    NavigationService.GoBack();
                }
            }
            else
            {
                var confirmchanges = MessageBox.Show("Вы уверены, что хотите изменить данные?", "Подтверждение", MessageBoxButton.YesNo, MessageBoxImage.Warning);
                if (confirmchanges == MessageBoxResult.Yes)
                {
                    Core.BD.SaveChanges();
                    MessageBox.Show("Данные изменены");
                    NavigationService.GoBack();
                }
            }
        }
    }
}
