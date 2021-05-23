setxkbmap -option caps:swapescape
xbindkeys -p

feh --bg-scale ~/.local/share/bg
picom &
xrdb -merge ~/.Xresources

exec cwm
