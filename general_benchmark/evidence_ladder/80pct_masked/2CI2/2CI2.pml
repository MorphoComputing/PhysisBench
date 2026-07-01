# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 4.489217507619987

load 2CI2.pdb, 2CI2
bg_color white
hide everything, 2CI2
show cartoon, 2CI2
color grey80, 2CI2
set cartoon_transparency, 0.1

select worst_residues, 2CI2 and resi 3+14+33+35+53+54+55+60+62+63
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2CI2 and resi 10+11+24+25+34+63
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2CI2 and resi 53 and name CA, 2CI2 and resi 62 and name CA  # target=19.904669200493696 current=10.90656481926392
color yellow, pair_00
distance pair_01, 2CI2 and resi 42 and name CA, 2CI2 and resi 63 and name CA  # target=8.511921711476202 current=15.387262511743122
color yellow, pair_01
distance pair_02, 2CI2 and resi 23 and name CA, 2CI2 and resi 35 and name CA  # target=26.53437813256754 current=19.667447506146694
color yellow, pair_02
distance pair_03, 2CI2 and resi 2 and name CA, 2CI2 and resi 36 and name CA  # target=23.207667679013912 current=16.508803935774175
color yellow, pair_03
distance pair_04, 2CI2 and resi 2 and name CA, 2CI2 and resi 14 and name CA  # target=19.227962659064307 current=13.118569663437608
color yellow, pair_04
distance pair_05, 2CI2 and resi 15 and name CA, 2CI2 and resi 60 and name CA  # target=13.979842393082857 current=8.582331451770967
color yellow, pair_05
distance pair_06, 2CI2 and resi 2 and name CA, 2CI2 and resi 10 and name CA  # target=19.107007751412826 current=13.8875415304131
color yellow, pair_06
distance pair_07, 2CI2 and resi 1 and name CA, 2CI2 and resi 36 and name CA  # target=26.19343203544971 current=21.165029598279727
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
