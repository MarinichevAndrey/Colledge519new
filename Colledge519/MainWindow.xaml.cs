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

namespace Colledge519
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            MyFrame.Navigate(new Pages.StartPage());
        }

        private void Groups_Button_Click(object sender, RoutedEventArgs e)
        {
            var p = new Pages.GroupPage();
            MyFrame.Navigate(p);
        }

        private void Setting_Button_Click(object sender, RoutedEventArgs e)
        {
            var w1 = new SettingsWindow();
            SettingsWindow w2 = new SettingsWindow();
            w1.Background = new SolidColorBrush(Color.FromRgb(55, 100, 55));
            w1.Show();
            w2.Show();
        }

        private void Students_Button_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new Pages.StudentPage());
        }

        private void Back_Button_Click(object sender, RoutedEventArgs e)
        {
            if (MyFrame.CanGoBack)
            MyFrame.GoBack();
        }

        private void Forward_Button_Click(object sender, RoutedEventArgs e)
        {
            if (MyFrame.CanGoForward)
            MyFrame.GoForward();
        }
    }
}
