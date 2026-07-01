# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1VII/sequence/1VII.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1VII/seeds/seed_1/1VII.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 2.477 A
- tm_score_ca_ordered: 0.4902648616711396
- heavy_atom_rmsd: 4.191 A
- sidechain_heavy_atom_rmsd: 5.276 A
- **all-atom quality (honest):** heavy 4.191 A, sidechain 5.276 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 99
- bin_accuracy: 0.707

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=insufficient_rmsd_improvement tested=27
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.4769256783792724
- ga_delta_rmsd: 2.4968208754543557  ga_fitness_mode: energy
- pre_local_rmsd: 2.4768787114954325  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=19 · strand(E)=7 · 3-10(G)=4 · coil(C)=4

```
CEHEHHHHHHEHHCHGGHHEGHHHEGHHEHHCEC
```

## Backbone H-bond Network

- total=15 · helix(i→i+4)=7 · sheet=8
  - D3 ↔ K7  (helix)
  - A8 ↔ M12  (helix)
  - S15 ↔ N19  (helix)
  - A18 ↔ L22  (helix)
  - N19 ↔ W23  (helix)
  - W23 ↔ N27  (helix)
  - N27 ↔ E31  (helix)
  - S2 ↔ G11  (sheet)
  - E4 ↔ G11  (sheet)
  - G11 ↔ L20  (sheet)
  - G11 ↔ Q25  (sheet)
  - G11 ↔ K29  (sheet)
  - L20 ↔ Q25  (sheet)
  - L20 ↔ K29  (sheet)
  - Q25 ↔ G33  (sheet)

## Solvent Accessibility (burial)

- buried=14 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=124 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=31 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.8332 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
