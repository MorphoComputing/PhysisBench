# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1FKF\sequence\1FKF.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1FKF\seeds\seed_0\1FKF.pdb`
- residues: 105
- mode: oracle
- ca_rmsd: 1.912 A
- tm_score_ca_ordered: 0.8736210663287094
- heavy_atom_rmsd: 3.635 A
- sidechain_heavy_atom_rmsd: 4.569 A
- **all-atom quality (honest):** heavy 3.635 A, sidechain 4.569 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/88 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 3442
- bin_accuracy: 0.614

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.9117384817414653
- ga_delta_rmsd: 0.03701992137093013  ga_fitness_mode: energy
- pre_local_rmsd: 1.9183818361180311  localized_anchor_rmsd: 1.911746499967639

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** Y81-T84 → 127 conflicts (38%); I90-P92 → 45 conflicts (13%); T74 → 18 conflicts (5%)
- explained: 190/336 conflicts by 3 root cause(s)
- metrics: hubs=60 (frac 0.571), conflicts/hub=5.6, max_incompat=5.62Å, chain_span=0.981
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): Y81-T84 + I90-P92 + T74 — explain ~190/336 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G27** — severity 21.23, 26 conflict(s); suspect input ~`G82` (group: pull_in)
  - pull-in (wants closer): I90@7.8Å(now 11.3,conf 0.36), G82@13.2Å(now 16.1,conf 0.34), T74@7.9Å(now 11.1,conf 0.35)
  - push-out (wants farther): D99@9.4Å(now 6.0,conf 0.34), L103@18.8Å(now 15.9,conf 0.38), E30@12.6Å(now 10.0,conf 0.34)
  - R39↔I90: targets 8.6/7.8Å but partners are 20.7Å apart → too_far_apart by 4.4Å
  - R39↔G82: targets 8.6/13.2Å but partners are 25.7Å apart → too_far_apart by 3.9Å
  - D36↔T74: targets 5.1/7.9Å but partners are 16.2Å apart → too_far_apart by 3.3Å
- **V1** — severity 19.57, 18 conflict(s); suspect input ~`P92` (group: push_out)
  - push-out (wants farther): D10@20.9Å(now 16.0,conf 0.43), R12@20.2Å(now 15.2,conf 0.41), P92@18.2Å(now 14.2,conf 0.37), A83@17.0Å(now 13.3,conf 0.35)
  - S76↔P92: targets 5.7/18.2Å but partners are 7.8Å apart → too_close_together by 4.7Å
  - P92↔P77: targets 18.2/9.1Å but partners are 4.4Å apart → too_close_together by 4.7Å
  - A83↔D78: targets 17.0/8.5Å but partners are 3.9Å apart → too_close_together by 4.6Å
- **R56** — severity 14.60, 15 conflict(s); suspect input ~`T84` (group: pull_in)
  - pull-in (wants closer): E4@14.7Å(now 17.6,conf 0.34)
  - push-out (wants farther): P91@17.4Å(now 14.9,conf 0.36), P92@16.6Å(now 13.8,conf 0.35), T84@16.0Å(now 11.0,conf 0.34), G85@14.7Å(now 11.9,conf 0.34)
  - D78↔T84: targets 7.3/16.0Å but partners are 3.9Å apart → too_close_together by 4.8Å
  - G82↔T84: targets 10.2/16.0Å but partners are 1.4Å apart → too_close_together by 4.5Å
  - Y79↔T84: targets 5.6/16.0Å but partners are 6.7Å apart → too_close_together by 3.7Å
- **T74** — severity 11.80, 14 conflict(s); suspect input ~`P77` (group: pull_in)
  - pull-in (wants closer): E101@10.6Å(now 13.7,conf 0.34), G27@7.9Å(now 11.1,conf 0.35)
  - push-out (wants farther): T84@18.7Å(now 14.7,conf 0.38), A83@17.6Å(now 13.9,conf 0.36), H93@15.1Å(now 12.4,conf 0.34), P92@16.7Å(now 13.2,conf 0.35)
  - D36↔G27: targets 17.4/7.9Å but partners are 5.3Å apart → too_close_together by 4.2Å
  - T84↔A80: targets 18.7/9.5Å but partners are 6.2Å apart → too_close_together by 3.0Å
  - A83↔P77: targets 17.6/10.2Å but partners are 4.4Å apart → too_close_together by 3.0Å
- **L73** — severity 11.27, 14 conflict(s); suspect input ~`D78` (group: push_out)
  - push-out (wants farther): T84@19.7Å(now 16.5,conf 0.40), A83@18.9Å(now 16.3,conf 0.38), G85@18.6Å(now 15.4,conf 0.37), D31@16.4Å(now 12.9,conf 0.35)
  - T84↔D78: targets 19.7/12.0Å but partners are 3.9Å apart → too_close_together by 3.9Å
  - E30↔D31: targets 9.9/16.4Å but partners are 3.4Å apart → too_close_together by 3.2Å
  - T84↔Y79: targets 19.7/9.9Å but partners are 6.7Å apart → too_close_together by 3.1Å
- **G57** — severity 10.85, 13 conflict(s); suspect input ~`T84` (group: push_out)
  - push-out (wants farther): G61@7.2Å(now 4.3,conf 0.37), I89@18.7Å(now 15.8,conf 0.38), P91@17.4Å(now 14.9,conf 0.36), I90@17.4Å(now 14.6,conf 0.36), A83@15.8Å(now 12.7,conf 0.34), T84@15.6Å(now 12.2,conf 0.34)
  - P91↔Y81: targets 17.4/8.4Å but partners are 5.8Å apart → too_close_together by 3.3Å
  - Y79↔T84: targets 5.6/15.6Å but partners are 6.7Å apart → too_close_together by 3.2Å
  - Y79↔A83: targets 5.6/15.8Å but partners are 7.2Å apart → too_close_together by 3.0Å

## Secondary Structure (DSSP-like)

- helix(H)=29 · strand(E)=35 · 3-10(G)=32 · coil(C)=9

```
CEGGGHCGHEEECEEECHEEGCEGEGGEGHGHEGHEEHHHGHEGEEEEEHEHHEHGHHGGHHHHEGCCEGEGGGGGGGHEHEHEGHHEGEECHHHEGGGEGGHEC
```

## Backbone H-bond Network

- total=43 · helix(i→i+4)=7 · sheet=36
  - F35 ↔ R39  (helix)
  - S38 ↔ N42  (helix)
  - E53 ↔ G57  (helix)
  - G57 ↔ G61  (helix)
  - W58 ↔ V62  (helix)
  - Y79 ↔ A83  (helix)
  - A83 ↔ P87  (helix)
  - D10 ↔ P15  (sheet)
  - F14 ↔ Q19  (sheet)
  - F14 ↔ T20  (sheet)
  - P15 ↔ T20  (sheet)
  - V23 ↔ S37  (sheet)
  - V23 ↔ K43  (sheet)
  - Y25 ↔ D36  (sheet)
  - Y25 ↔ S37  (sheet)
  - Y25 ↔ K43  (sheet)
  - Y25 ↔ F45  (sheet)
  - M28 ↔ K33  (sheet)
  - M28 ↔ D36  (sheet)
  - M28 ↔ S37  (sheet)
  - … +23 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=23 · exposed=60 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=459 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=264 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0829 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 88 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1FKF.ensemble.pdb`)
- RMSF mean=0.485Å max=4.419Å (per-residue in .per_residue.csv)
- most flexible residues: 88, 87, 91, 84, 93

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1FKF.pae.csv`
- mean=0.252Å · max=4.437Å · AlphaFold-PAE analog (low block = rigid unit/domain)
