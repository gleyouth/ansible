

Single master version
```
# ansible-playbook -i hosts deploy.yaml -uroot -k
```


E.g：Run only deployment plugin
```
# ansible-playbook -i hosts deploy.yaml -uroot -k --tags addons
```
