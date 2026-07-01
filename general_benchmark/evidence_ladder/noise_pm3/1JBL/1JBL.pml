# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.3655794978870706

load 1JBL.pdb, 1JBL
bg_color white
hide everything, 1JBL
show cartoon, 1JBL
color grey80, 1JBL
set cartoon_transparency, 0.1

select worst_residues, 1JBL and resi 2+4+5+6+7+8+9+10+11+12
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1JBL and resi 5+11
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1JBL and resi 1 and name CA, 1JBL and resi 11 and name CA  # target=8.509147712106854 current=4.785553901943402
color yellow, pair_00
distance pair_01, 1JBL and resi 2 and name CA, 1JBL and resi 10 and name CA  # target=6.59880197225203 current=3.648918635742336
color yellow, pair_01
distance pair_02, 1JBL and resi 2 and name CA, 1JBL and resi 12 and name CA  # target=12.1737047917236 current=9.281422586156694
color yellow, pair_02
distance pair_03, 1JBL and resi 4 and name CA, 1JBL and resi 12 and name CA  # target=15.68487973495592 current=13.789487872520706
color yellow, pair_03
distance pair_04, 1JBL and resi 3 and name CA, 1JBL and resi 11 and name CA  # target=9.121590847524724 current=7.265368760608407
color yellow, pair_04
distance pair_05, 1JBL and resi 1 and name CA, 1JBL and resi 9 and name CA  # target=8.969758215168572 current=7.22267530707789
color yellow, pair_05
distance pair_06, 1JBL and resi 3 and name CA, 1JBL and resi 12 and name CA  # target=9.38707583172081 current=11.104251276103605
color yellow, pair_06
distance pair_07, 1JBL and resi 1 and name CA, 1JBL and resi 10 and name CA  # target=6.373642051113435 current=5.30244849783623
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
