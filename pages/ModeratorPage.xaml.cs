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
using template_wpf.db;

namespace template_wpf.pages
{
    /// <summary>
    /// Логика взаимодействия для ModeratorPage.xaml
    /// </summary>
    public partial class ModeratorPage : Page
    {
        public ModeratorPage(user _user, Window parent)
        {
            InitializeComponent();
        }
    }
}
