# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/2CRD/sequence/2CRD.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/2CRD/seeds/seed_0/2CRD.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 5.576 A
- tm_score_ca_ordered: 0.14360799437831467
- heavy_atom_rmsd: 6.996 A
- sidechain_heavy_atom_rmsd: 8.388 A
- **all-atom quality (honest):** heavy 6.996 A, sidechain 8.388 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 21
- distogram_pairs: 99
- bin_accuracy: 0.343

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=insufficient_rmsd_improvement tested=27
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.576547753599165
- ga_delta_rmsd: 0.6624863744995197  ga_fitness_mode: energy
- pre_local_rmsd: 5.576459013652333  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** R17-S22 → 17 conflicts (85%); V14 → 3 conflicts (15%)
- explained: 20/20 conflicts by 2 root cause(s)
- metrics: hubs=11 (frac 0.324), conflicts/hub=1.8, max_incompat=7.02Å, chain_span=0.853
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): R17-S22 + V14 — explain ~20/20 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T21** — severity 7.62, 3 conflict(s); suspect input ~`Y34` (group: push_out)
  - push-out (wants farther): T6@19.8Å(now 16.1,conf 0.57), M27@17.5Å(now 10.4,conf 0.55), S13@9.1Å(now 6.5,conf 0.55)
  - M27↔Y34: targets 17.5/7.0Å but partners are 3.5Å apart → too_close_together by 7.0Å
  - Q16↔M27: targets 4.5/17.5Å but partners are 9.2Å apart → too_close_together by 3.8Å
  - T6↔Y34: targets 19.8/7.0Å but partners are 9.6Å apart → too_close_together by 3.2Å
- **K30** — severity 3.40, 2 conflict(s); suspect input ~`K25` (group: push_out)
  - push-out (wants farther): H19@16.6Å(now 12.8,conf 0.55), S22@16.3Å(now 10.9,conf 0.55)
  - H19↔K25: targets 16.6/9.1Å but partners are 4.0Å apart → too_close_together by 3.5Å
  - K25↔S22: targets 9.1/16.3Å but partners are 4.5Å apart → too_close_together by 2.8Å
- **H19** — severity 3.38, 3 conflict(s); suspect input ~`C33` (group: push_out)
  - push-out (wants farther): K29@19.9Å(now 15.6,conf 0.58), C5@17.9Å(now 14.8,conf 0.55), K30@16.6Å(now 12.8,conf 0.55), G24@11.2Å(now 5.2,conf 0.55), K25@14.5Å(now 4.0,conf 0.55), E10@14.2Å(now 11.3,conf 0.55)
  - K29↔C33: targets 19.9/9.0Å but partners are 8.3Å apart → too_close_together by 2.5Å
  - C5↔T1: targets 17.9/10.6Å but partners are 5.4Å apart → too_close_together by 1.9Å
  - K29↔R32: targets 19.9/11.9Å but partners are 6.3Å apart → too_close_together by 1.7Å
- **V14** — severity 2.95, 3 conflict(s); suspect input ~`M27` (group: push_out)
  - push-out (wants farther): M27@14.6Å(now 9.1,conf 0.55), Y34@11.4Å(now 8.1,conf 0.55)
  - C31↔M27: targets 9.0/14.6Å but partners are 3.6Å apart → too_close_together by 2.1Å
  - R32↔M27: targets 9.3/14.6Å but partners are 3.5Å apart → too_close_together by 1.8Å
  - C31↔Y34: targets 9.0/11.4Å but partners are 0.9Å apart → too_close_together by 1.6Å
- **R17** — severity 2.67, 2 conflict(s); suspect input ~`C26` (group: push_out)
  - push-out (wants farther): Y34@12.8Å(now 9.7,conf 0.55), R32@13.2Å(now 9.6,conf 0.55), R23@11.3Å(now 5.2,conf 0.55), C26@16.2Å(now 8.6,conf 0.55)
  - S13↔C26: targets 6.1/16.2Å but partners are 7.2Å apart → too_close_together by 3.0Å
  - S13↔R23: targets 6.1/11.3Å but partners are 3.2Å apart → too_close_together by 1.9Å
- **S22** — severity 2.25, 2 conflict(s); suspect input ~`K9` (group: push_out)
  - push-out (wants farther): K29@19.6Å(now 14.2,conf 0.57), K30@16.3Å(now 10.9,conf 0.55), K25@10.0Å(now 4.5,conf 0.55)
  - K29↔K9: targets 19.6/10.7Å but partners are 6.8Å apart → too_close_together by 2.1Å
  - K9↔K30: targets 10.7/16.3Å but partners are 3.6Å apart → too_close_together by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=21 · strand(E)=8 · 3-10(G)=5 · coil(C)=0

```
EEHGHHGHGHHEHHHHHHHHEHGGHHEEHEHHHE
```

## Backbone H-bond Network

- total=20 · helix(i→i+4)=9 · sheet=11
  - T6 ↔ E10  (helix)
  - C11 ↔ C15  (helix)
  - S13 ↔ R17  (helix)
  - C15 ↔ H19  (helix)
  - Q16 ↔ N20  (helix)
  - L18 ↔ S22  (helix)
  - S22 ↔ C26  (helix)
  - K25 ↔ K29  (helix)
  - K29 ↔ C33  (helix)
  - T1 ↔ W12  (sheet)
  - T1 ↔ T21  (sheet)
  - N2 ↔ W12  (sheet)
  - W12 ↔ T21  (sheet)
  - W12 ↔ M27  (sheet)
  - W12 ↔ K30  (sheet)
  - T21 ↔ M27  (sheet)
  - T21 ↔ K30  (sheet)
  - T21 ↔ Y34  (sheet)
  - M27 ↔ Y34  (sheet)
  - N28 ↔ Y34  (sheet)

## Solvent Accessibility (burial)

- buried=9 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=244 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=151 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.8498 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=21 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C26, C11–C31, C15–C33

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`2CRD.ensemble.pdb`)
- RMSF mean=2.339Å max=4.422Å (per-residue in .per_residue.csv)
- most flexible residues: 19, 29, 1, 23, 9

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `2CRD.pae.csv`
- mean=1.151Å · max=5.738Å · AlphaFold-PAE analog (low block = rigid unit/domain)
