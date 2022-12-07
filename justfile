# execute the local playbook
install:
    @ansible-playbook --ask-become-pass tests/local-play.yml
