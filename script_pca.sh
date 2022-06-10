rm tprout.tpr
rm red.xtc
rm topol.tpr

gmx_d grompp -f md-2.mdp -c ../top/min.gro -p ../top/topol
gmx_d convert-tpr -s topol.tpr <<EOF
1
EOF

gmx_d trjconv -f md_1000 -s tprout.tpr -skip 10 -o red.xtc <<EOF
1
EOF

gmx_d covar -f md_1000.xtc -s tprout.tpr <<EOF
0
0
EOF


gmx_d  trjconv -f eigenvec.trr -s tprout.tpr -o eigenvec.gro <<EOF
0
EOF
