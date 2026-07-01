# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS | CA RMSD: 0.6842887980407426

load 1NB1.pdb, 1NB1
bg_color white
hide everything, 1NB1
show cartoon, 1NB1
color grey80, 1NB1
set cartoon_transparency, 0.1

select worst_residues, 1NB1 and resi 1+8+14+15+17+18+22+24+25+27
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1NB1 and resi 5 and name CA, 1NB1 and resi 19 and name CA  # target=5.930684497290852 current=4.995722164315501
color yellow, pair_00
distance pair_01, 1NB1 and resi 2 and name CA, 1NB1 and resi 27 and name CA  # target=10.275139393216168 current=9.350432389103858
color yellow, pair_01
distance pair_02, 1NB1 and resi 2 and name CA, 1NB1 and resi 21 and name CA  # target=5.903973690124367 current=5.012331589816844
color yellow, pair_02
distance pair_03, 1NB1 and resi 5 and name CA, 1NB1 and resi 18 and name CA  # target=7.197185846324258 current=6.316237923748404
color yellow, pair_03
distance pair_04, 1NB1 and resi 1 and name CA, 1NB1 and resi 27 and name CA  # target=8.468705938720609 current=7.613246031189923
color yellow, pair_04
distance pair_05, 1NB1 and resi 3 and name CA, 1NB1 and resi 19 and name CA  # target=6.047067546978847 current=5.317296645488061
color yellow, pair_05
distance pair_06, 1NB1 and resi 3 and name CA, 1NB1 and resi 20 and name CA  # target=5.128172839177744 current=4.458254149454512
color yellow, pair_06
distance pair_07, 1NB1 and resi 11 and name CA, 1NB1 and resi 24 and name CA  # target=13.09248836515061 current=12.466144616625632
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
