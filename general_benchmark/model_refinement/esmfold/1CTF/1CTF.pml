# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS | CA RMSD: 0.47917604774293915

load 1CTF.pdb, 1CTF
bg_color white
hide everything, 1CTF
show cartoon, 1CTF
color grey80, 1CTF
set cartoon_transparency, 0.1

select worst_residues, 1CTF and resi 8+9+10+11+12+35+36+44+60+61
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1CTF and resi 10 and name CA, 1CTF and resi 46 and name CA  # target=26.902585772342867 current=28.464146623634097
color yellow, pair_00
distance pair_01, 1CTF and resi 9 and name CA, 1CTF and resi 48 and name CA  # target=22.909960654896864 current=24.30647683743545
color yellow, pair_01
distance pair_02, 1CTF and resi 9 and name CA, 1CTF and resi 47 and name CA  # target=23.103890429616303 current=24.485729875806797
color yellow, pair_02
distance pair_03, 1CTF and resi 9 and name CA, 1CTF and resi 45 and name CA  # target=23.040591038223766 current=24.354658710881356
color yellow, pair_03
distance pair_04, 1CTF and resi 10 and name CA, 1CTF and resi 44 and name CA  # target=26.668527137679877 current=27.916893574055564
color yellow, pair_04
distance pair_05, 1CTF and resi 9 and name CA, 1CTF and resi 46 and name CA  # target=24.627573988567708 current=25.875568229102825
color yellow, pair_05
distance pair_06, 1CTF and resi 9 and name CA, 1CTF and resi 44 and name CA  # target=23.777826724066664 current=25.004702547388106
color yellow, pair_06
distance pair_07, 1CTF and resi 28 and name CA, 1CTF and resi 47 and name CA  # target=26.712913081049987 current=27.911037008907346
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
