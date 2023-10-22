# .dotfiles
My Dotfiles

## Installation

1. Install `ansible`.
    
    Probably something like.

    ```console
    $ sudo apt install ansible
    ```
    or
    ```console
    $ sudo apt install python3 python3-pip
    $ pip install ansible
    ```
2. Install dependencies.

    ```
    $ ansible-galaxy install --role-file requirements.yml
    ```
    or shorter
    ```
    $ ansible-galaxy install -r requirements.yml
    ```

3. Install everything.

    ```conosole
    $ ansible-playbook --ask-become-pass bootstrap.yml
    ```
    or shorter
    ```
    $ ansible-playbook -K bootstrap.yml
    ```
