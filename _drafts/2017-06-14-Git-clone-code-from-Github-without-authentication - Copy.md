---

title: 6 Git clone code from Github without authentication

tags: [Git, authentication, password]

layout: post

categories: [Tool]

sub_class: gIhub

abstract: An instruction to get checkout code from Github without any password and username via Git command.

date: 2017-06-14

author: Bing

---

**Generate an SSH key**
=======================

**Linux/Mac**

Open terminal to create SSH Keys.

```
cd ~ #Your home directory
ssh-keygen -t rsa #Press enter for all values
```

**For Windows**

(Only works if the commit program is capable of using certificates/private & public ssh keys)

1.	Use Putty Gen to generate a key;
2.	Export the key as an open SSH key.

Here is a [walkthrough](https://askleo.com/how_do_i_create_and_use_public_keys_with_ssh/) on putty gen for above steps.

**Associate the SSH key with the remote repository**
====================================================

The following steps will be conducted by an administrator of the Github repository that you want to clone. If you do not have any administrative privileges, please give your **id_ras.pub** to administrator.

1.	Using your account and password to login [Github](https://github.com/)
2.	Go to **setting** page
3.	Click **SSH and GPK keys** item on your left vertical panel
4.	In the **SSH keys** section of your right page, click **New SSH key** button to add a new ssh key to your github account.
5.	Type in the title name and the key content from your **id_ras.pub** file, then click **Add SSH key**.

**Set your remote URL to a form that supports SSH**
===================================================

Go to repository that you want to clone, then click **clone or download** button on your right page and choose "SSH" format to checkout the code. The SSH format looks like the following example.

```
git@github.com:bingrao/bingrao.github.io.git
```

The opposed format, **HTTPS**, is:

```
https://github.com/bingrao/bingrao.github.io.git
```

When you got **SSH** link, you can use the following command to checkout code.

```
git clone git@github.com:bingrao/bingrao.github.io.git
======================================================
```
