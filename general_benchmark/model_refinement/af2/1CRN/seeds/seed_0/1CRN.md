# Physis Fold — Run Report

**Verdict:** PASS

- reference_pdb: `set\general_benchmark\1CRN\sequence\1CRN.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\1CRN\seeds\seed_0\1CRN.pdb`
- residues: 44
- mode: oracle
- ca_rmsd: 0.400 A
- tm_score_ca_ordered: 0.9631757708502181
- heavy_atom_rmsd: 2.098 A
- sidechain_heavy_atom_rmsd: 2.727 A
- **all-atom quality (honest):** heavy 2.098 A, sidechain 2.727 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/35 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 861
- bin_accuracy: 0.942

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.399786203707802
- ga_delta_rmsd: 0.007759113157985498  ga_fitness_mode: energy
- pre_local_rmsd: 0.4147033566922667  localized_anchor_rmsd: 0.3997445294583589

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`

## Secondary Structure (DSSP-like)

- helix(H)=23 · strand(E)=10 · 3-10(G)=8 · coil(C)=3

```
CEGHEHHHHHHHHHHGHHHEHGHGHHHHGHEECEHEGEECGHGE
```

## Backbone H-bond Network

- total=22 · helix(i→i+4)=13 · sheet=9
  - P4 ↔ A8  (helix)
  - I6 ↔ S10  (helix)
  - V7 ↔ N11  (helix)
  - A8 ↔ F12  (helix)
  - R9 ↔ N13  (helix)
  - S10 ↔ V14  (helix)
  - N11 ↔ C15  (helix)
  - N13 ↔ L17  (helix)
  - V14 ↔ P18  (helix)
  - C15 ↔ G19  (helix)
  - G19 ↔ A23  (helix)
  - A23 ↔ T27  (helix)
  - A26 ↔ G30  (helix)
  - C31 ↔ C39  (sheet)
  - C31 ↔ A44  (sheet)
  - I32 ↔ T38  (sheet)
  - I32 ↔ C39  (sheet)
  - I32 ↔ A44  (sheet)
  - I34 ↔ C39  (sheet)
  - I34 ↔ A44  (sheet)
  - … +2 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=18 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=149 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=49 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1211 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C39, C3–C31, C15–C25

## Side-chain Rotamers (χ1/χ2)

- 35 residues with modelled χ angles (full table in report JSON)
