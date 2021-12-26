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
using template_wpf.common;
using template_wpf.db;
using template_wpf.widgets;

namespace template_wpf.pages
{
    /// <summary>
    /// Логика взаимодействия для UserPage.xaml
    /// </summary>
    public partial class UserPage : Page
    {
        
        Window parentWindow;

        public UserPage(user _user, Window parent)
        {
            InitializeComponent();
            DataContext = _user;
            parentWindow = parent;

            InitRolesCB();
            updateData();
        }

        private void updateData()
        {
            var friends = (DataContext as user).friendship.ToList();

            if (FilterCB.SelectedIndex > 0)
                friends = friends.Where((item) => item.user1.user_role == ((user_role)FilterCB.SelectedItem)).ToList();

            if ((bool)NameUpCheckB.IsChecked && !(bool)NameDownCheckB.IsChecked)
                friends = friends.OrderByDescending(item => item.user1.name).ToList();

            if (!(bool)NameUpCheckB.IsChecked && (bool)NameDownCheckB.IsChecked)
                friends = friends.OrderBy(item => item.user1.name).ToList();

            if (!string.IsNullOrEmpty(searchTB.Text))
                friends = friends.Where(item => item.user1.name.Contains(searchTB.Text)).ToList();

            userTabel.ItemsSource = friends;
        }

        private void InitRolesCB()
        {
            FilterCB.Items.Add(new user_role()
            {
                name = "--- no ---"
            });
            FilterCB.SelectedIndex = 0;
            Instance.GetContext().user_role.ToList().ForEach((user_role role) =>
            {
                FilterCB.Items.Add(role);
            });
        }

        private void AddFriendShip_Click(object sender, RoutedEventArgs e)
        {
            CommonWindow window = new CommonWindow();
            window.setPage(new AddNewFriendWidget(DataContext as user, window));
            window.ShowDialog();
            
            updateData();
        }

        private void BtnRemove_Click(object sender, RoutedEventArgs e)
        {
            string login = (sender as Button).Tag as string;
            if (string.IsNullOrEmpty(login))
                return;

            user employee = DataContext as user;

            friendship ship = employee.friendship.Where(p => p.login_recirver == login).FirstOrDefault();

            Instance.GetContext().friendship.Remove(ship);
            Instance.GetContext().SaveChanges();
            Instance.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
            updateData();
        }

        private void FilterCB_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            updateData();
        }

        private void searchTB_TextChanged(object sender, TextChangedEventArgs e)
        {
            updateData();
        }

        private void NameUpCheckB_Checked(object sender, RoutedEventArgs e)
        {
            updateData();
        }
    }
}
