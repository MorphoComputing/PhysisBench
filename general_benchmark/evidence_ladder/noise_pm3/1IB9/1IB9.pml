# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.1454361973001266

load 1IB9.pdb, 1IB9
bg_color white
hide everything, 1IB9
show cartoon, 1IB9
color grey80, 1IB9
set cartoon_transparency, 0.1

select worst_residues, 1IB9 and resi 1+4+8+10+17+18+19+22+24+25
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1IB9 and resi 4+9+17+25+39+66
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1IB9 and resi 12 and name CA, 1IB9 and resi 20 and name CA  # target=12.549712297174132 current=5.858997924956376
color yellow, pair_00
distance pair_01, 1IB9 and resi 14 and name CA, 1IB9 and resi 25 and name CA  # target=14.547616899204266 current=8.118123572303942
color yellow, pair_01
distance pair_02, 1IB9 and resi 7 and name CA, 1IB9 and resi 31 and name CA  # target=17.480313640337446 current=11.05206226938623
color yellow, pair_02
distance pair_03, 1IB9 and resi 12 and name CA, 1IB9 and resi 29 and name CA  # target=16.40177011842455 current=10.312775545256427
color yellow, pair_03
distance pair_04, 1IB9 and resi 9 and name CA, 1IB9 and resi 28 and name CA  # target=21.057329161875302 current=14.991955447663416
color yellow, pair_04
distance pair_05, 1IB9 and resi 8 and name CA, 1IB9 and resi 24 and name CA  # target=13.674929978655564 current=7.694605362671818
color yellow, pair_05
distance pair_06, 1IB9 and resi 12 and name CA, 1IB9 and resi 32 and name CA  # target=10.673643791393843 current=5.023155734858621
color yellow, pair_06
distance pair_07, 1IB9 and resi 6 and name CA, 1IB9 and resi 14 and name CA  # target=8.77963873629858 current=14.32432775164
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
