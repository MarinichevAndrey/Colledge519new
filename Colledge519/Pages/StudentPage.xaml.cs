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
    /// Логика взаимодействия для StudentPage.xaml
    /// </summary>
    public partial class StudentPage : Page, INotifyPropertyChanged
    {
        public StudentPage()
        {
            InitializeComponent();
            DataContext = this;
        }

        private List<Students> _allStudents;

        public List<Students> OurStudents {
            get
            {
                return _allStudents;
            }
            set
            {
                _allStudents = value;
                PropertyChanged(this, new PropertyChangedEventArgs("OurStudents"));
            }
        }
        private List<Groups> _allGroups;
        public List<Groups> OurGroups {
            get 
            {
                return _allGroups;
            }
            set
            {
                _allGroups = value;
                PropertyChanged(this, new PropertyChangedEventArgs("OurGroups"));
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;

        private void cmbGroup_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var item = cmbGroup.SelectedItem as Groups;
            OurStudents = item.Students.ToList();
            StudentsList.ItemsSource = OurStudents;
        }

        private void tbSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            var search = tbSearch.Text;
            OurStudents = Core.BD.Students.Where(s => s.Name.ToLower().Contains(search.ToLower()) ||
            s.Surname.ToLower().Contains(search.ToLower()) ||
            s.Patronymic.ToLower().Contains(search.ToLower())
            ).ToList();
            StudentsList.ItemsSource = OurStudents;
        }

        private void btnCreateStudent_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new StudentEditAddPage(null));
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            OurStudents = Core.BD.Students.ToList();
            OurGroups = Core.BD.Groups.ToList();
        }
    }
}
