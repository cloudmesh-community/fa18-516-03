# PI setup notes

# SSH
SSH is not currently enabled after cm-burn completes because of permission
issues in the ~/.ssh folder. The result of editing the file system in Python
through extFS currently is that the files are owned by 501:dialer owner and
group. The ~/.ssh folder had the correct permissions in a second test case, but
the pi user could now not access the folder due to the permission settings.

```
drwx------ 2  501 dialout 4096 Oct  3 22:33 .ssh
```

My uid on OS X it 501, my gid is 20 which matches dialout on the pi.

Steps to resolve:

  * [ ] In python chown .ssh and authorized_keys to pi:pi
  * [ ] Double check that the permissions change is working
  * [ ] Once everything is verified, also disable password login

# hostname problems
Every invocation of `sudo` prints: `sudo: unable to resolve host gru1` because
the hostname setup done in /etc/hostname was not also completed in /etc/hosts.
We need to edit /etc/hosts/ replacing `raspberrypi` with the hostname.


