# Dicas sobre o github

``` markdown
File:		 GitHub.md
Created:	 ter 10 jan 2017 13:45:09 BRT
Last Change: 2018 fev 16 15:31
```

referências: http://stackoverflow.com/questions/23821235/

# Para especificar um range de linhas no github coloque

    #L18-L20

    No final da url

    Para gerar uma url canônica (como uma foto do projeto como ele está agora)
    use o atalho

      y

# Para pegar mais facilmente ainda um range de linhas

faça o seguinte:

Clique no número da linha inicial, segure o shift e então
clique no numero da linha final do range, o github se encarrega de
adicionar o código apropriado no final da url

Após o github adicionar o código na url pressione "y" no seu
broser, não pode ser no campo da url, daí o github modifica a url
pra oferecer o endereço do commit em particular, evitando que
novo código adicionado em commits subsequentes alterem a
visualização do conteúdo

# Adding your ssh key to github

    ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

This creates a new ssh key, using the provided email as a label.

    Generating public/private rsa key pair.

When you're prompted to "Enter a file in which to save the key," press Enter.
This accepts the default file location.

    Enter a file in which to save the key (/home/you/.ssh/id_rsa): [Press enter]

    At the prompt, type a secure passphrase. For more information, see "Working with SSH key passphrases".

    Enter passphrase (empty for no passphrase): [Type a passphrase]
    Enter same passphrase again: [Type passphrase again]

Adding your SSH key to the ssh-agent

Before adding a new SSH key to the ssh-agent to manage your keys, you should
have checked for existing SSH keys and generated a new SSH key.

    Start the ssh-agent in the background.

    eval "$(ssh-agent -s)"
    Agent pid 59566

Add your SSH private key to the ssh-agent. If you created your key with a
different name, or if you are adding an existing key that has a different name,
replace id_rsa in the command with the name of your private key file.

    ssh-add ~/.ssh/id_rsa

    Add the SSH key to your GitHub account.


# Adding ssh key to your github account

    $ sudo pacman -S xclip
    # Downloads and installs xclip. If you don't have `pacman`, you might need to use another installer (like `yum`)

    $ xclip -sel clip < ~/.ssh/id_rsa.pub
    # Copies the contents of the id_rsa.pub file to your clipbo

# Mirroing a github repo on gitlab

    ``` markdown
    https://gitlab.com/voyeg3r/dotfaster/settings/repository

    Pull from a remote repository
    check mirror repository
    ```
