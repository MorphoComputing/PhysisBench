# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.2881924193215608

load 1YCC.pdb, 1YCC
bg_color white
hide everything, 1YCC
show cartoon, 1YCC
color grey80, 1YCC
set cartoon_transparency, 0.1

select worst_residues, 1YCC and resi 1+3+4+5+6+8+54+75+77+78
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1YCC and resi 6 and name CA, 1YCC and resi 54 and name CA  # target=27.49999908702405 current=33.43262127583321
color yellow, pair_00
distance pair_01, 1YCC and resi 8 and name CA, 1YCC and resi 54 and name CA  # target=27.49999917700067 current=33.382354272855046
color yellow, pair_01
distance pair_02, 1YCC and resi 8 and name CA, 1YCC and resi 58 and name CA  # target=27.499997104005004 current=32.99482796330608
color yellow, pair_02
distance pair_03, 1YCC and resi 49 and name CA, 1YCC and resi 90 and name CA  # target=27.499994920776018 current=32.97077251906856
color yellow, pair_03
distance pair_04, 1YCC and resi 49 and name CA, 1YCC and resi 88 and name CA  # target=27.499988486165417 current=32.614776677041
color yellow, pair_04
distance pair_05, 1YCC and resi 9 and name CA, 1YCC and resi 54 and name CA  # target=27.499994973860197 current=32.51438103664977
color yellow, pair_05
distance pair_06, 1YCC and resi 5 and name CA, 1YCC and resi 54 and name CA  # target=27.499994890289475 current=32.366616209913296
color yellow, pair_06
distance pair_07, 1YCC and resi 9 and name CA, 1YCC and resi 58 and name CA  # target=27.499986511544588 current=32.271640740729254
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
