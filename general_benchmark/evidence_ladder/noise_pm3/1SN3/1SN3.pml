# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.8823264729682296

load 1SN3.pdb, 1SN3
bg_color white
hide everything, 1SN3
show cartoon, 1SN3
color grey80, 1SN3
set cartoon_transparency, 0.1

select worst_residues, 1SN3 and resi 1+2+3+12+19+21+60+61+62+63
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1SN3 and resi 5+35+51+92+348+742
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1SN3 and resi 1 and name CA, 1SN3 and resi 45 and name CA  # target=20.197909744152476 current=10.552222290128114
color yellow, pair_00
distance pair_01, 1SN3 and resi 16 and name CA, 1SN3 and resi 45 and name CA  # target=18.292518389513994 current=9.016200295057576
color yellow, pair_01
distance pair_02, 1SN3 and resi 3 and name CA, 1SN3 and resi 62 and name CA  # target=18.973780514343623 current=10.006088175683306
color yellow, pair_02
distance pair_03, 1SN3 and resi 2 and name CA, 1SN3 and resi 33 and name CA  # target=16.112893590926053 current=7.1980134733917245
color yellow, pair_03
distance pair_04, 1SN3 and resi 1 and name CA, 1SN3 and resi 33 and name CA  # target=17.208095080509228 current=9.093504231901195
color yellow, pair_04
distance pair_05, 1SN3 and resi 3 and name CA, 1SN3 and resi 27 and name CA  # target=16.732829639564383 current=8.859268067932526
color yellow, pair_05
distance pair_06, 1SN3 and resi 32 and name CA, 1SN3 and resi 62 and name CA  # target=10.910272693165153 current=18.583156550809893
color yellow, pair_06
distance pair_07, 1SN3 and resi 16 and name CA, 1SN3 and resi 44 and name CA  # target=15.884146992784107 current=8.30799987701912
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
