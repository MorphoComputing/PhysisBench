# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.474547717437864

load 1UBQ.pdb, 1UBQ
bg_color white
hide everything, 1UBQ
show cartoon, 1UBQ
color grey80, 1UBQ
set cartoon_transparency, 0.1

select worst_residues, 1UBQ and resi 30+37+38+53+56+63+71+72+73+74
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1UBQ and resi 3+4+13+25
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1UBQ and resi 62 and name CA, 1UBQ and resi 74 and name CA  # target=27.493869175640796 current=34.77372577889749
color yellow, pair_00
distance pair_01, 1UBQ and resi 61 and name CA, 1UBQ and resi 74 and name CA  # target=27.48536928651804 current=34.25259723286322
color yellow, pair_01
distance pair_02, 1UBQ and resi 1 and name CA, 1UBQ and resi 74 and name CA  # target=27.44137506151611 current=33.14476899308505
color yellow, pair_02
distance pair_03, 1UBQ and resi 18 and name CA, 1UBQ and resi 74 and name CA  # target=27.44783795188693 current=33.09754120071911
color yellow, pair_03
distance pair_04, 1UBQ and resi 19 and name CA, 1UBQ and resi 74 and name CA  # target=27.469463586597765 current=33.03600754091663
color yellow, pair_04
distance pair_05, 1UBQ and resi 17 and name CA, 1UBQ and resi 74 and name CA  # target=27.488646119770717 current=32.95888262791592
color yellow, pair_05
distance pair_06, 1UBQ and resi 59 and name CA, 1UBQ and resi 74 and name CA  # target=27.479943307628997 current=32.89619831945726
color yellow, pair_06
distance pair_07, 1UBQ and resi 63 and name CA, 1UBQ and resi 74 and name CA  # target=27.48943718282126 current=32.90443277864103
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
