# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.8751312038350871

load 1ENH.pdb, 1ENH
bg_color white
hide everything, 1ENH
show cartoon, 1ENH
color grey80, 1ENH
set cartoon_transparency, 0.1

select worst_residues, 1ENH and resi 1+2+3+4+25+26+41+45+47+48
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1ENH and resi 6
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1ENH and resi 1 and name CA, 1ENH and resi 47 and name CA  # target=19.49879896589018 current=15.407016328971663
color yellow, pair_00
distance pair_01, 1ENH and resi 1 and name CA, 1ENH and resi 48 and name CA  # target=17.901380241512616 current=13.865337267773356
color yellow, pair_01
distance pair_02, 1ENH and resi 1 and name CA, 1ENH and resi 44 and name CA  # target=15.513635283538932 current=11.749324040490205
color yellow, pair_02
distance pair_03, 1ENH and resi 2 and name CA, 1ENH and resi 47 and name CA  # target=16.65300564124952 current=12.892684799489013
color yellow, pair_03
distance pair_04, 1ENH and resi 1 and name CA, 1ENH and resi 45 and name CA  # target=16.11334293801498 current=12.356781301123776
color yellow, pair_04
distance pair_05, 1ENH and resi 2 and name CA, 1ENH and resi 41 and name CA  # target=11.217513395756221 current=7.734617864904225
color yellow, pair_05
distance pair_06, 1ENH and resi 2 and name CA, 1ENH and resi 44 and name CA  # target=12.826100962870852 current=9.352055583021269
color yellow, pair_06
distance pair_07, 1ENH and resi 1 and name CA, 1ENH and resi 49 and name CA  # target=20.177373066734074 current=16.751246026415945
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
