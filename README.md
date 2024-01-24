The skeleton of my $HOME directory, dotfiles, configurations, environment
settings and whatnot..

## SwayWM Notes

I just started using Sway as my main Desktop Environment / Window Manager and it
has been great so far. 
It's a great alternative to DWM, which I used in the past and it's easy to setup.

To remove xwayland dependencies and be pure-wayland, I had to compile Emacs from
source, configure with pure-GTK, libjansson & native compilation for a faster
experience.

As for Firefox, the only requirement is to have this environment variable
exported to toggle the Wayland flag of firefox:

```
$ export MOZ_ENABLE_WAYLAND=1
```
