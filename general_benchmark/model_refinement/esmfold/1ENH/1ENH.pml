# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.7185466647829967

load 1ENH.pdb, 1ENH
bg_color white
hide everything, 1ENH
show cartoon, 1ENH
color grey80, 1ENH
set cartoon_transparency, 0.1

select worst_residues, 1ENH and resi 1+2+3+24+25+26+38+39+41+47
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1ENH and resi 1 and name CA, 1ENH and resi 47 and name CA  # target=17.982042873931732 current=15.0508163517215
color yellow, pair_00
distance pair_01, 1ENH and resi 2 and name CA, 1ENH and resi 44 and name CA  # target=12.078417623204901 current=9.182587515073859
color yellow, pair_01
distance pair_02, 1ENH and resi 1 and name CA, 1ENH and resi 44 and name CA  # target=14.101663961255955 current=11.254686590793824
color yellow, pair_02
distance pair_03, 1ENH and resi 2 and name CA, 1ENH and resi 47 and name CA  # target=15.666785447050668 current=12.854055484126789
color yellow, pair_03
distance pair_04, 1ENH and resi 2 and name CA, 1ENH and resi 41 and name CA  # target=10.671814553022816 current=7.867668541649894
color yellow, pair_04
distance pair_05, 1ENH and resi 1 and name CA, 1ENH and resi 48 and name CA  # target=16.243671286928432 current=13.665415362968025
color yellow, pair_05
distance pair_06, 1ENH and resi 1 and name CA, 1ENH and resi 45 and name CA  # target=14.6108339510125 current=12.110278267893058
color yellow, pair_06
distance pair_07, 1ENH and resi 1 and name CA, 1ENH and resi 41 and name CA  # target=12.301281830248445 current=9.891070156204274
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
