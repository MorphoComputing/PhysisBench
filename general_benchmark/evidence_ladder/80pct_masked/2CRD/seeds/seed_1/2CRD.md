# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/2CRD/sequence/2CRD.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/2CRD/seeds/seed_1/2CRD.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 6.984 A
- tm_score_ca_ordered: 0.09309176893524918
- heavy_atom_rmsd: 8.637 A
- sidechain_heavy_atom_rmsd: 9.857 A
- **all-atom quality (honest):** heavy 8.637 A, sidechain 9.857 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 18
- distogram_pairs: 99
- bin_accuracy: 0.333

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=residue_block reason=accepted tested=27
- rigid_domain_reconvergence: applied=True accepted=2 rmsd=6.635935392579952 -> 6.176600890638656 A
- topology_reconvergence: applied=True accepted=6/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.983970197949819
- ga_delta_rmsd: -0.8020025250098239  ga_fitness_mode: energy
- pre_local_rmsd: 6.98391711028795  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** R17-S22 → 20 conflicts (80%); N28-C31 → 4 conflicts (16%)
- explained: 24/25 conflicts by 2 root cause(s)
- metrics: hubs=11 (frac 0.324), conflicts/hub=2.3, max_incompat=7.39Å, chain_span=0.706
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): R17-S22 + N28-C31 — explain ~24/25 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **H19** — severity 11.56, 7 conflict(s); suspect input ~`C33` (group: push_out)
  - push-out (wants farther): K29@19.9Å(now 9.1,conf 0.58), C5@17.9Å(now 14.6,conf 0.55), K30@16.6Å(now 13.1,conf 0.55), K25@14.5Å(now 11.6,conf 0.55)
  - K29↔C33: targets 19.9/9.0Å but partners are 5.4Å apart → too_close_together by 5.4Å
  - K29↔T1: targets 19.9/10.6Å but partners are 5.6Å apart → too_close_together by 3.7Å
  - K30↔R32: targets 16.6/11.9Å but partners are 1.4Å apart → too_close_together by 3.2Å
- **S13** — severity 9.79, 5 conflict(s); suspect input ~`N28` (group: push_out)
  - push-out (wants farther): N28@18.1Å(now 9.3,conf 0.55), K29@17.9Å(now 7.5,conf 0.55), M27@15.9Å(now 10.7,conf 0.55)
  - R17↔N28: targets 6.1/18.1Å but partners are 6.4Å apart → too_close_together by 5.6Å
  - R17↔K29: targets 6.1/17.9Å but partners are 7.3Å apart → too_close_together by 4.5Å
  - N28↔T21: targets 18.1/9.1Å but partners are 5.9Å apart → too_close_together by 3.1Å
- **S22** — severity 8.31, 3 conflict(s); suspect input ~`C11` (group: push_out)
  - push-out (wants farther): K29@19.6Å(now 6.9,conf 0.57), K30@16.3Å(now 10.9,conf 0.55), K25@10.0Å(now 4.7,conf 0.55)
  - K29↔C11: targets 19.6/8.6Å but partners are 3.5Å apart → too_close_together by 7.4Å
  - K29↔K25: targets 19.6/10.0Å but partners are 5.6Å apart → too_close_together by 4.0Å
  - C11↔K30: targets 8.6/16.3Å but partners are 3.8Å apart → too_close_together by 3.9Å
- **T21** — severity 4.81, 2 conflict(s); suspect input ~`Y34` (group: push_out)
  - push-out (wants farther): M27@17.5Å(now 10.3,conf 0.55)
  - M27↔Y34: targets 17.5/7.0Å but partners are 5.6Å apart → too_close_together by 5.0Å
  - Q16↔M27: targets 4.5/17.5Å but partners are 9.2Å apart → too_close_together by 3.8Å
- **R17** — severity 3.18, 2 conflict(s); suspect input ~`C11` (group: push_out)
  - push-out (wants farther): Y34@12.8Å(now 9.0,conf 0.55), R23@11.3Å(now 7.5,conf 0.55), C26@16.2Å(now 7.9,conf 0.55), S4@15.9Å(now 10.5,conf 0.55)
  - C26↔C11: targets 16.2/10.0Å but partners are 3.1Å apart → too_close_together by 3.1Å
  - S13↔C26: targets 6.1/16.2Å but partners are 7.4Å apart → too_close_together by 2.7Å
- **W12** — severity 1.88, 1 conflict(s); suspect input ~`N28` (group: push_out)
  - push-out (wants farther): N2@13.6Å(now 9.4,conf 0.55), N28@15.7Å(now 6.2,conf 0.55)
  - Q16↔N28: targets 6.3/15.7Å but partners are 5.9Å apart → too_close_together by 3.5Å

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=11 · 3-10(G)=2 · coil(C)=1

```
EHHHEHECGEHEHHHHHEHHEEHHHHHHHGHEEE
```

## Backbone H-bond Network

- total=31 · helix(i→i+4)=8 · sheet=23
  - N2 ↔ T6  (helix)
  - C11 ↔ C15  (helix)
  - S13 ↔ R17  (helix)
  - C15 ↔ H19  (helix)
  - H19 ↔ R23  (helix)
  - R23 ↔ M27  (helix)
  - G24 ↔ N28  (helix)
  - M27 ↔ C31  (helix)
  - T1 ↔ T7  (sheet)
  - T1 ↔ E10  (sheet)
  - T1 ↔ W12  (sheet)
  - T1 ↔ L18  (sheet)
  - C5 ↔ E10  (sheet)
  - C5 ↔ W12  (sheet)
  - T7 ↔ W12  (sheet)
  - E10 ↔ L18  (sheet)
  - E10 ↔ T21  (sheet)
  - E10 ↔ S22  (sheet)
  - W12 ↔ L18  (sheet)
  - W12 ↔ T21  (sheet)
  - … +11 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=10 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=223 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=128 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.3294 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=18 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C26, C11–C31, C15–C33

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
