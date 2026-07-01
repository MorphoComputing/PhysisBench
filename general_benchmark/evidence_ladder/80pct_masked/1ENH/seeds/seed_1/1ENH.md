# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1ENH/sequence/1ENH.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1ENH/seeds/seed_1/1ENH.pdb`
- residues: 52
- mode: oracle
- ca_rmsd: 7.566 A
- tm_score_ca_ordered: 0.22573078618925313
- heavy_atom_rmsd: 8.808 A
- sidechain_heavy_atom_rmsd: 9.761 A
- **all-atom quality (honest):** heavy 8.808 A, sidechain 9.761 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/47 (0.0)
- lj_severe: 0
- lj_near: 17
- distogram_pairs: 245
- bin_accuracy: 0.343

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 7.56561849660956
- ga_delta_rmsd: 1.1915579056338412  ga_fitness_mode: energy
- pre_local_rmsd: 7.565598250178518  localized_anchor_rmsd: 7.565598250178518

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** S7-Q9 → 22 conflicts (63%); L23-E25 → 7 conflicts (20%)
- explained: 29/35 conflicts by 2 root cause(s)
- metrics: hubs=18 (frac 0.346), conflicts/hub=1.9, max_incompat=6.94Å, chain_span=0.885
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): S7-Q9 + L23-E25 — explain ~29/35 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E8** — severity 12.22, 5 conflict(s); suspect input ~`K14` (group: push_out)
  - push-out (wants farther): T24@21.6Å(now 16.1,conf 0.61), R21@18.5Å(now 11.8,conf 0.55), R27@18.2Å(now 14.7,conf 0.55), N18@15.5Å(now 12.9,conf 0.55), A4@11.6Å(now 8.9,conf 0.55)
  - T24↔K14: targets 21.6/10.0Å but partners are 6.4Å apart → too_close_together by 5.2Å
  - T24↔R15: targets 21.6/10.7Å but partners are 6.0Å apart → too_close_together by 4.8Å
  - R21↔K14: targets 18.5/10.0Å but partners are 3.8Å apart → too_close_together by 4.7Å
- **Q9** — severity 9.00, 4 conflict(s); suspect input ~`Y22` (group: push_out)
  - push-out (wants farther): E25@18.6Å(now 10.1,conf 0.55), Y22@17.6Å(now 9.2,conf 0.55), P1@17.3Å(now 13.7,conf 0.55), R27@15.2Å(now 9.4,conf 0.55), R28@13.6Å(now 8.0,conf 0.55), N38@12.1Å(now 8.9,conf 0.55)
  - L13↔Y22: targets 6.1/17.6Å but partners are 5.1Å apart → too_close_together by 6.4Å
  - E25↔L13: targets 18.6/6.1Å but partners are 7.3Å apart → too_close_together by 5.2Å
  - E25↔R27: targets 18.6/15.2Å but partners are 0.7Å apart → too_close_together by 2.6Å
- **S7** — severity 8.96, 5 conflict(s); suspect input ~`R15` (group: push_out)
  - push-out (wants farther): E25@23.3Å(now 13.2,conf 0.76), T24@23.1Å(now 13.9,conf 0.74), L23@20.5Å(now 11.5,conf 0.59), R50@19.5Å(now 13.6,conf 0.57), K43@17.9Å(now 12.2,conf 0.55), N48@17.6Å(now 12.9,conf 0.55), T3@12.9Å(now 7.8,conf 0.55), L31@15.5Å(now 11.2,conf 0.55)
  - T24↔R15: targets 23.1/12.3Å but partners are 6.0Å apart → too_close_together by 4.7Å
  - L23↔R15: targets 20.5/12.3Å but partners are 3.8Å apart → too_close_together by 4.4Å
  - E25↔L31: targets 23.3/15.5Å but partners are 4.8Å apart → too_close_together by 3.0Å
- **T24** — severity 6.17, 3 conflict(s); suspect input ~`Q29` (group: pull_in)
  - pull-in (wants closer): A40@12.7Å(now 16.1,conf 0.55)
  - push-out (wants farther): S7@23.1Å(now 13.9,conf 0.74), E8@21.6Å(now 16.1,conf 0.61), A11@19.4Å(now 7.2,conf 0.57), E34@15.3Å(now 11.6,conf 0.55), E19@12.7Å(now 6.1,conf 0.55)
  - S7↔Q29: targets 23.1/8.6Å but partners are 9.6Å apart → too_close_together by 4.8Å
  - A11↔Q29: targets 19.4/8.6Å but partners are 6.7Å apart → too_close_together by 4.1Å
  - S7↔A40: targets 23.1/12.7Å but partners are 8.0Å apart → too_close_together by 2.4Å
- **E19** — severity 4.64, 2 conflict(s); suspect input ~`E25` (group: push_out)
  - push-out (wants farther): T24@12.7Å(now 6.1,conf 0.55), E25@15.8Å(now 10.1,conf 0.55)
  - E16↔E25: targets 5.1/15.8Å but partners are 5.9Å apart → too_close_together by 4.8Å
  - E16↔T24: targets 5.1/12.7Å but partners are 3.8Å apart → too_close_together by 3.8Å
- **A11** — severity 3.78, 1 conflict(s); suspect input ~`E16` (group: push_out)
  - push-out (wants farther): T24@19.4Å(now 7.2,conf 0.57), F46@13.2Å(now 10.1,conf 0.55)
  - T24↔E16: targets 19.4/8.7Å but partners are 3.8Å apart → too_close_together by 6.9Å

## Secondary Structure (DSSP-like)

- helix(H)=37 · strand(E)=11 · 3-10(G)=3 · coil(C)=1

```
EEEHEHHHEHHHHHGHHEHHEHHHHHHHHEHEHHGHHCHEHHHHGHHHHHHE
```

## Backbone H-bond Network

- total=26 · helix(i→i+4)=19 · sheet=7
  - A4 ↔ E8  (helix)
  - S6 ↔ L10  (helix)
  - S7 ↔ A11  (helix)
  - E8 ↔ R12  (helix)
  - L10 ↔ K14  (helix)
  - R12 ↔ E16  (helix)
  - L13 ↔ F17  (helix)
  - E16 ↔ N20  (helix)
  - E19 ↔ L23  (helix)
  - Y22 ↔ R26  (helix)
  - E25 ↔ Q29  (helix)
  - Q29 ↔ S33  (helix)
  - S33 ↔ L37  (helix)
  - E39 ↔ K43  (helix)
  - I42 ↔ F46  (helix)
  - K43 ↔ Q47  (helix)
  - I44 ↔ N48  (helix)
  - F46 ↔ R50  (helix)
  - Q47 ↔ A51  (helix)
  - R2 ↔ Q9  (sheet)
  - … +6 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=22 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=303 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=158 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.6433 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=17 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 47 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
