# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 5.814045144389611

load 1CTF.pdb, 1CTF
bg_color white
hide everything, 1CTF
show cartoon, 1CTF
color grey80, 1CTF
set cartoon_transparency, 0.1

select worst_residues, 1CTF and resi 1+8+9+10+11+13+44+46+47+60
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1CTF and resi 12+16+21+48+60+95
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1CTF and resi 10 and name CA, 1CTF and resi 45 and name CA  # target=27.34900670802457 current=12.264591833004742
color yellow, pair_00
distance pair_01, 1CTF and resi 6 and name CA, 1CTF and resi 47 and name CA  # target=18.68383286234838 current=4.9531736938309985
color yellow, pair_01
distance pair_02, 1CTF and resi 9 and name CA, 1CTF and resi 46 and name CA  # target=27.30646359200291 current=14.368402507862601
color yellow, pair_02
distance pair_03, 1CTF and resi 7 and name CA, 1CTF and resi 47 and name CA  # target=21.3014004780218 current=8.788576116242709
color yellow, pair_03
distance pair_04, 1CTF and resi 40 and name CA, 1CTF and resi 60 and name CA  # target=16.98260388279088 current=7.014995333392971
color yellow, pair_04
distance pair_05, 1CTF and resi 12 and name CA, 1CTF and resi 48 and name CA  # target=24.033315189397335 current=14.47978904879891
color yellow, pair_05
distance pair_06, 1CTF and resi 6 and name CA, 1CTF and resi 56 and name CA  # target=14.194722672579053 current=4.777088191205938
color yellow, pair_06
distance pair_07, 1CTF and resi 43 and name CA, 1CTF and resi 58 and name CA  # target=17.586306262140454 current=8.926415457952091
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
