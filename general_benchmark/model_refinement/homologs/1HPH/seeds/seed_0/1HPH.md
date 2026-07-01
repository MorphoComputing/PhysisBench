# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HPH\sequence\1HPH.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\1HPH\seeds\seed_0\1HPH.pdb`
- residues: 35
- mode: oracle
- ca_rmsd: 5.705 A
- tm_score_ca_ordered: 0.14780978033561853
- heavy_atom_rmsd: 7.428 A
- sidechain_heavy_atom_rmsd: 8.671 A
- **all-atom quality (honest):** heavy 7.428 A, sidechain 8.671 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 219
- bin_accuracy: 0.731

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.704632070384139
- ga_delta_rmsd: -0.06311610896439568  ga_fitness_mode: energy
- pre_local_rmsd: 5.704653136514364  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=13 · 3-10(G)=2 · coil(C)=2

```
CEHHHHHHEHHEHGHEHHCHGEEHEHHEHEEEHEE
```

## Backbone H-bond Network

- total=22 · helix(i→i+4)=5 · sheet=17
  - E3 ↔ M7  (helix)
  - M7 ↔ G11  (helix)
  - H13 ↔ M17  (helix)
  - V20 ↔ R24  (helix)
  - D29 ↔ F33  (helix)
  - S2 ↔ N9  (sheet)
  - K12 ↔ W22  (sheet)
  - S16 ↔ W22  (sheet)
  - S16 ↔ L23  (sheet)
  - W22 ↔ Q28  (sheet)
  - W22 ↔ V30  (sheet)
  - L23 ↔ Q28  (sheet)
  - L23 ↔ V30  (sheet)
  - L23 ↔ H31  (sheet)
  - K25 ↔ V30  (sheet)
  - K25 ↔ H31  (sheet)
  - K25 ↔ N32  (sheet)
  - K25 ↔ V34  (sheet)
  - K25 ↔ A35  (sheet)
  - Q28 ↔ V34  (sheet)
  - … +2 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=13 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=84 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=2 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7791 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
