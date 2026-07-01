# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TEN\sequence\1TEN.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\1TEN\seeds\seed_1\1TEN.pdb`
- residues: 88
- mode: oracle
- ca_rmsd: 3.895 A
- tm_score_ca_ordered: 0.6770802229449865
- heavy_atom_rmsd: 4.961 A
- sidechain_heavy_atom_rmsd: 5.931 A
- **all-atom quality (honest):** heavy 4.961 A, sidechain 5.931 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/79 (0.0)
- lj_severe: 0
- lj_near: 9
- distogram_pairs: 2454
- bin_accuracy: 0.731

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.8949630530696475
- ga_delta_rmsd: 0.4416154668241159  ga_fitness_mode: energy
- pre_local_rmsd: 3.9458886792393693  localized_anchor_rmsd: 3.894991739058512

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** L1-P4 → 814 conflicts (92%)
- explained: 814/890 conflicts by 1 root cause(s)
- metrics: hubs=54 (frac 0.614), conflicts/hub=16.5, max_incompat=14.69Å, chain_span=0.932
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): L1-P4 — explain ~814/890 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L71** — severity 78.14, 36 conflict(s); suspect input ~`A83` (group: push_out)
  - push-out (wants farther): L1@27.5Å(now 12.7,conf 1.00), A3@27.5Å(now 15.6,conf 1.00), P4@21.2Å(now 13.6,conf 0.44), Q6@18.5Å(now 15.9,conf 0.37)
  - L1↔A83: targets 27.5/5.6Å but partners are 9.5Å apart → too_close_together by 12.4Å
  - A3↔A83: targets 27.5/5.6Å but partners are 10.2Å apart → too_close_together by 11.7Å
  - L1↔P82: targets 27.5/6.0Å but partners are 9.3Å apart → too_close_together by 12.2Å
- **I72** — severity 76.14, 34 conflict(s); suspect input ~`P82` (group: push_out)
  - push-out (wants farther): L1@27.5Å(now 10.8,conf 1.00), A3@27.5Å(now 15.7,conf 1.00), P4@23.2Å(now 14.2,conf 0.50), Q6@19.9Å(now 16.7,conf 0.40)
  - L1↔P82: targets 27.5/5.3Å but partners are 9.3Å apart → too_close_together by 13.0Å
  - L1↔S80: targets 27.5/5.9Å but partners are 7.6Å apart → too_close_together by 14.0Å
  - L1↔N81: targets 27.5/6.5Å but partners are 6.3Å apart → too_close_together by 14.7Å
- **A83** — severity 64.74, 32 conflict(s); suspect input ~`I7` (group: push_out)
  - push-out (wants farther): L1@27.5Å(now 9.5,conf 1.00), A3@27.5Å(now 10.2,conf 1.00), P4@24.6Å(now 12.7,conf 0.56), Q6@22.0Å(now 16.2,conf 0.47), S5@21.6Å(now 18.4,conf 0.45)
  - L1↔S80: targets 27.5/8.4Å but partners are 7.6Å apart → too_close_together by 11.5Å
  - L1↔L71: targets 27.5/5.6Å but partners are 12.7Å apart → too_close_together by 9.2Å
  - L1↔I72: targets 27.5/6.6Å but partners are 10.8Å apart → too_close_together by 10.1Å
- **I7** — severity 60.62, 26 conflict(s); suspect input ~`W21` (group: push_out)
  - push-out (wants farther): L1@27.5Å(now 12.6,conf 1.00), A3@27.5Å(now 10.0,conf 1.00), P4@19.9Å(now 8.0,conf 0.40)
  - A3↔W21: targets 27.5/5.1Å but partners are 12.0Å apart → too_close_together by 10.4Å
  - L1↔W21: targets 27.5/5.1Å but partners are 13.0Å apart → too_close_together by 9.4Å
  - W21↔P4: targets 5.1/19.9Å but partners are 4.0Å apart → too_close_together by 10.8Å
- **E85** — severity 60.39, 35 conflict(s); suspect input ~`I7` (group: push_out)
  - push-out (wants farther): L1@27.5Å(now 16.5,conf 1.00), A3@27.5Å(now 14.2,conf 1.00), P4@23.6Å(now 15.4,conf 0.51), Q6@22.3Å(now 18.1,conf 0.47)
  - A3↔I7: targets 27.5/7.2Å but partners are 10.0Å apart → too_close_together by 10.3Å
  - P4↔I7: targets 23.6/7.2Å but partners are 8.0Å apart → too_close_together by 8.3Å
  - P4↔W21: targets 23.6/11.0Å but partners are 4.0Å apart → too_close_together by 8.6Å
- **L33** — severity 56.24, 34 conflict(s); suspect input ~`L71` (group: push_out)
  - push-out (wants farther): L1@27.5Å(now 16.4,conf 1.00), A3@27.5Å(now 18.8,conf 1.00), P4@18.5Å(now 13.1,conf 0.37)
  - L1↔L71: targets 27.5/5.5Å but partners are 12.7Å apart → too_close_together by 9.4Å
  - L1↔I72: targets 27.5/7.3Å but partners are 10.8Å apart → too_close_together by 9.3Å
  - A3↔L71: targets 27.5/5.5Å but partners are 15.6Å apart → too_close_together by 6.5Å

## Secondary Structure (DSSP-like)

- helix(H)=22 · strand(E)=38 · 3-10(G)=15 · coil(C)=13

```
CEHEHGHECEGGEHEEEGCCEHHEGEHCEHEEGCEECEHHCECEEGGCEHEHGHEGECEHEHEHECEEGGGHHEHHHEEEGCHGEEEE
```

## Backbone H-bond Network

- total=63 · helix(i→i+4)=5 · sheet=58
  - A3 ↔ I7  (helix)
  - K23 ↔ E27  (helix)
  - T50 ↔ N54  (helix)
  - N60 ↔ D64  (helix)
  - S73 ↔ D77  (helix)
  - D2 ↔ E8  (sheet)
  - D2 ↔ W21  (sheet)
  - P4 ↔ K10  (sheet)
  - P4 ↔ W21  (sheet)
  - P4 ↔ P24  (sheet)
  - E8 ↔ A17  (sheet)
  - E8 ↔ W21  (sheet)
  - E8 ↔ P24  (sheet)
  - K10 ↔ T16  (sheet)
  - K10 ↔ A17  (sheet)
  - K10 ↔ W21  (sheet)
  - T16 ↔ Y35  (sheet)
  - T16 ↔ G36  (sheet)
  - A17 ↔ Y35  (sheet)
  - A17 ↔ G36  (sheet)
  - … +43 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=36 · exposed=30 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=350 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=235 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.0363 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=9 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 79 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1TEN.ensemble.pdb`)
- RMSF mean=0.964Å max=5.091Å (per-residue in .per_residue.csv)
- most flexible residues: 54, 23, 28, 53, 24

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1TEN.pae.csv`
- mean=0.643Å · max=6.204Å · AlphaFold-PAE analog (low block = rigid unit/domain)
