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
using System.ComponentModel;

namespace Colledge519.Pages
{
    /// <summary>
    /// Логика взаимодействия для GroupPage.xaml
    /// </summary>
    public partial class GroupPage : Page, INotifyPropertyChanged
    {
        public GroupPage()
        {
            InitializeComponent();
            DataContext = this;
        }
        private List<Groups> _allGroups;
        public List<Groups> AllGroups {
            get
            {
                return _allGroups;
            } set
            {
                _allGroups = value;
                PropertyChanged(this, new PropertyChangedEventArgs("AllGroups"));
            }
        }

        private List<Students> _allStudents;
        public List<Students> AllStudents {
            get
            {
                return _allStudents;
            } 
            set
            {
                _allStudents = value;
                PropertyChanged(this, new PropertyChangedEventArgs("AllStudents"));
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;

        private void GroupsList_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var item = GroupsList.SelectedItem as Groups;
            AllStudents = item.Students.ToList();
            lCurator.Content = "Куратор: ";
            lCurator.Content = lCurator.Content + item.teachers.Surname + " " + item.teachers.Name + " " + item.teachers.Patronimic;
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            var item = StudentsList.SelectedItem as Students;
            NavigationService.Navigate(new StudentEditAddPage(item));
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            var item = StudentsList.SelectedItem as Students;
            Core.BD.Students.Remove(item);
            Core.BD.SaveChanges();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            AllStudents = Core.BD.Students.ToList();
            AllGroups = Core.BD.Groups.ToList();
        }
    }
}
