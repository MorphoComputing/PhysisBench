# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2KNM\seeds\seed_8\2KNM.pdb`
- residues: 28
- mode: oracle
- ca_rmsd: 5.141 A
- tm_score_ca_ordered: 0.12709118953993154
- heavy_atom_rmsd: 5.955 A
- sidechain_heavy_atom_rmsd: 6.495 A
- **all-atom quality (honest):** heavy 5.955 A, sidechain 6.495 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 159
- bin_accuracy: 0.610

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=27
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.140727751066323
- ga_delta_rmsd: -0.9566178582856191  ga_fitness_mode: energy
- pre_local_rmsd: 5.1408084535113225  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.036), conflicts/hub=1.0, max_incompat=2.08Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C3** — severity 1.22, 1 conflict(s); suspect input ~`I10` (group: push_out)
  - push-out (wants farther): I10@13.5Å(now 10.8,conf 0.58), C12@8.4Å(now 4.7,conf 0.55)
  - S6↔I10: targets 7.1/13.5Å but partners are 4.3Å apart → too_close_together by 2.1Å

## Secondary Structure (DSSP-like)

- helix(H)=4 · strand(E)=11 · 3-10(G)=4 · coil(C)=9

```
CECEECHEGCEEHEHCCECECGCGGHEE
```

## Backbone H-bond Network

- total=27 · helix(i→i+4)=0 · sheet=27
  - P2 ↔ P11  (sheet)
  - P2 ↔ C12  (sheet)
  - P2 ↔ S14  (sheet)
  - P2 ↔ G18  (sheet)
  - P2 ↔ S20  (sheet)
  - G4 ↔ P11  (sheet)
  - G4 ↔ C12  (sheet)
  - G4 ↔ S14  (sheet)
  - G4 ↔ G18  (sheet)
  - G4 ↔ S20  (sheet)
  - E5 ↔ P11  (sheet)
  - E5 ↔ C12  (sheet)
  - E5 ↔ S14  (sheet)
  - E5 ↔ S20  (sheet)
  - P11 ↔ S20  (sheet)
  - P11 ↔ Y27  (sheet)
  - C12 ↔ G18  (sheet)
  - C12 ↔ S20  (sheet)
  - C12 ↔ Y27  (sheet)
  - C12 ↔ R28  (sheet)
  - … +7 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=15 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=125 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=76 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.0404 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
