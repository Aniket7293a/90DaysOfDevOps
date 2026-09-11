


Day 09 Challenge – Linux User & Group Management
 Objective
Today I practiced Linux user and group management and learned how groups and permissions can be used to manage access to shared directories.

👤 Users Created
The following users were created with home directories:

tokyo

berlin

professor

nairobi

Commands Used
sudo useradd -m tokyo
sudo useradd -m berlin
sudo useradd -m professor

sudo passwd tokyo
sudo passwd berlin
sudo passwd professor
For Task 5:

sudo useradd -m nairobi
sudo passwd nairobi
Verification
cat /etc/passwd | grep -E 'tokyo|berlin|professor|nairobi'
ls /home
👥 Groups Created
The following groups were created:

developers

admins

project-team

Commands Used
sudo groupadd developers
sudo groupadd admins
sudo groupadd project-team
Verification
cat /etc/group | grep -E 'developers|admins|project-team'
🔐 Group Assignments
User	Groups
tokyo	developers, project-team
berlin	developers, admins
professor	admins
nairobi	project-team
Commands Used
sudo usermod -aG developers tokyo
sudo usermod -aG developers,admins berlin
sudo usermod -aG admins professor

sudo usermod -aG project-team nairobi
sudo usermod -aG project-team tokyo
Verification
groups tokyo
groups berlin
groups professor
groups nairobi
📂 Shared Development Directory
1. Create the directory
sudo mkdir -p /opt/dev-project
2. Set group ownership
sudo chgrp developers /opt/dev-project
3. Set permissions
sudo chmod 775 /opt/dev-project
775 means:

rwxrwxr-x
Owner → read, write, execute

Group → read, write, execute

Others → read, execute

4. Verify permissions
ls -ld /opt/dev-project
5. Test file creation
Create a file as tokyo:

sudo -u tokyo touch /opt/dev-project/tokyo-file.txt
Create a file as berlin:

sudo -u berlin touch /opt/dev-project/berlin-file.txt
Verify:

ls -l /opt/dev-project
🤝 Team Workspace
1. Create the directory
sudo mkdir -p /opt/team-workspace
2. Set group ownership
sudo chgrp project-team /opt/team-workspace
3. Set permissions
sudo chmod 775 /opt/team-workspace
4. Verify
ls -ld /opt/team-workspace
5. Test as nairobi
sudo -u nairobi touch /opt/team-workspace/test-file.txt
Verify:

ls -l /opt/team-workspace
🧪 Verification Summary
Users
tokyo
berlin
professor
nairobi
Groups
developers
admins
project-team
Directories
Directory	Group Owner	Permissions
/opt/dev-project	developers	775
/opt/team-workspace	project-team	775
🛠️ Important Commands Practiced
Command	Purpose
useradd -m	Create a user with a home directory
passwd	Set a user password
groupadd	Create a group
usermod -aG	Add a user to supplementary groups
groups	Check group membership
mkdir -p	Create a directory
chgrp	Change group ownership
chmod 775	Set directory permissions
ls -ld	Check directory permissions
sudo -u	Run a command as another user
touch	Create an empty file
📖 What I Learned
Linux users and groups can be used to organize access on a server.

Group ownership and permissions make it easier to create shared workspaces.

sudo -u is useful for testing what another user can access or create.

One thing I understood better today was how 775 permissions allow the owner and group members to work inside a directory while giving others read and execute access.

🚀 DevOps Connection
User and group management is an important part of working with Linux servers.

In a real DevOps environment, different users may need different levels of access to application files, deployment directories, and server resources. Using groups and permissions helps manage this access in a controlled way.

✅ Day 09 Completed
Another step completed in my 90 Days of DevOps journey.

#90DaysOfDevOps #DevOpsKaJosh #TrainWithShubham
