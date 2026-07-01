# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.2813815368247603

load 1GCN.pdb, 1GCN
bg_color white
hide everything, 1GCN
show cartoon, 1GCN
color grey80, 1GCN
set cartoon_transparency, 0.1

select worst_residues, 1GCN and resi 1+2+4+10+11+13+14+17+24+25
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1GCN and resi 1 and name CA, 1GCN and resi 24 and name CA  # target=42.39053381197033 current=40.78831727786938
color yellow, pair_00
distance pair_01, 1GCN and resi 1 and name CA, 1GCN and resi 21 and name CA  # target=37.37993419335209 current=36.008717084569525
color yellow, pair_01
distance pair_02, 1GCN and resi 8 and name CA, 1GCN and resi 26 and name CA  # target=28.203174656006073 current=29.52247142235936
color yellow, pair_02
distance pair_03, 1GCN and resi 6 and name CA, 1GCN and resi 25 and name CA  # target=31.668727417370903 current=30.401491334582275
color yellow, pair_03
distance pair_04, 1GCN and resi 3 and name CA, 1GCN and resi 19 and name CA  # target=28.017716983245496 current=29.228693789695793
color yellow, pair_04
distance pair_05, 1GCN and resi 5 and name CA, 1GCN and resi 26 and name CA  # target=33.15185751712 current=34.27518945055287
color yellow, pair_05
distance pair_06, 1GCN and resi 3 and name CA, 1GCN and resi 22 and name CA  # target=32.819145345924746 current=33.91962306350923
color yellow, pair_06
distance pair_07, 1GCN and resi 5 and name CA, 1GCN and resi 24 and name CA  # target=32.38503958912823 current=31.34591936943095
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
