# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4PTI\sequence\4PTI.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\4PTI\seeds\seed_1\4PTI.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 0.484 A
- tm_score_ca_ordered: 0.9642536250937391
- heavy_atom_rmsd: 3.006 A
- sidechain_heavy_atom_rmsd: 3.979 A
- **all-atom quality (honest):** heavy 3.006 A, sidechain 3.979 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1431
- bin_accuracy: 0.659

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.4837392523455685
- ga_delta_rmsd: 0.056933424392311305  ga_fitness_mode: energy
- pre_local_rmsd: 0.49908991786637674  localized_anchor_rmsd: 0.4837252775537159

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** P7-Y9 → 26 conflicts (65%); G55 → 4 conflicts (10%)
- explained: 30/40 conflicts by 2 root cause(s)
- metrics: hubs=14 (frac 0.25), conflicts/hub=2.9, max_incompat=3.6Å, chain_span=0.964
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): P7-Y9 + G55 — explain ~30/40 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P7** — severity 6.38, 8 conflict(s); suspect input ~`C29` (group: pull_in)
  - pull-in (wants closer): Y22@6.2Å(now 8.7,conf 0.40)
  - C29↔Y22: targets 13.7/6.2Å but partners are 4.0Å apart → too_close_together by 3.5Å
  - M51↔Y22: targets 16.5/6.2Å but partners are 7.2Å apart → too_close_together by 3.0Å
  - E48↔Y22: targets 18.9/6.2Å but partners are 10.3Å apart → too_close_together by 2.4Å
- **Y9** — severity 5.45, 7 conflict(s); suspect input ~`N23` (group: pull_in)
  - pull-in (wants closer): N23@10.4Å(now 13.0,conf 0.34)
  - G27↔N23: targets 19.1/10.4Å but partners are 5.2Å apart → too_close_together by 3.5Å
  - A26↔N23: targets 18.1/10.4Å but partners are 5.0Å apart → too_close_together by 2.7Å
  - N23↔C37: targets 10.4/7.9Å but partners are 20.9Å apart → too_far_apart by 2.6Å
- **Y22** — severity 4.97, 5 conflict(s); suspect input ~`E48` (group: pull_in)
  - pull-in (wants closer): P7@6.2Å(now 8.7,conf 0.40)
  - E48↔P7: targets 8.7/6.2Å but partners are 18.5Å apart → too_far_apart by 3.6Å
  - G55↔P7: targets 6.3/6.2Å but partners are 15.5Å apart → too_far_apart by 3.0Å
  - C50↔P7: targets 5.2/6.2Å but partners are 13.6Å apart → too_far_apart by 2.3Å
- **N23** — severity 4.16, 6 conflict(s); suspect input ~`Y9` (group: pull_in)
  - pull-in (wants closer): Y9@10.4Å(now 13.0,conf 0.34)
  - push-out (wants farther): L28@8.4Å(now 4.8,conf 0.35)
  - P12↔Y9: targets 21.4/10.4Å but partners are 8.4Å apart → too_close_together by 2.6Å
  - G27↔Y9: targets 5.4/10.4Å but partners are 18.0Å apart → too_far_apart by 2.2Å
  - T10↔Y9: targets 16.2/10.4Å but partners are 3.5Å apart → too_close_together by 2.2Å
- **Y34** — severity 2.84, 3 conflict(s); suspect input ~`G55` (group: pull_in)
  - pull-in (wants closer): G55@18.2Å(now 20.7,conf 0.37)
  - G55↔K14: targets 18.2/7.1Å but partners are 28.8Å apart → too_far_apart by 3.5Å
  - G55↔A15: targets 18.2/6.9Å but partners are 27.3Å apart → too_far_apart by 2.2Å
  - G56↔G55: targets 24.1/18.2Å but partners are 3.8Å apart → too_close_together by 2.1Å
- **N42** — severity 1.46, 2 conflict(s); suspect input ~`L5` (group: push_out)
  - push-out (wants farther): D2@11.8Å(now 8.9,conf 0.34), L5@11.3Å(now 7.8,conf 0.34)
  - C4↔L5: targets 5.2/11.3Å but partners are 3.7Å apart → too_close_together by 2.4Å
  - F3↔D2: targets 6.5/11.8Å but partners are 3.4Å apart → too_close_together by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=23 · 3-10(G)=9 · coil(C)=8

```
EEHHHECECHEHECEEECEEGCCGHGHECEEEGGGGEEEEGHEEGEHHHHHHHCHE
```

## Backbone H-bond Network

- total=40 · helix(i→i+4)=2 · sheet=38
  - E48 ↔ R52  (helix)
  - D49 ↔ T53  (helix)
  - P1 ↔ E6  (sheet)
  - P8 ↔ R19  (sheet)
  - P8 ↔ Y20  (sheet)
  - G11 ↔ R16  (sheet)
  - G11 ↔ I17  (sheet)
  - G11 ↔ R19  (sheet)
  - A15 ↔ F32  (sheet)
  - R16 ↔ T31  (sheet)
  - R16 ↔ F32  (sheet)
  - I17 ↔ T31  (sheet)
  - I17 ↔ F32  (sheet)
  - I17 ↔ C37  (sheet)
  - R19 ↔ Q30  (sheet)
  - R19 ↔ T31  (sheet)
  - R19 ↔ F32  (sheet)
  - R19 ↔ C37  (sheet)
  - R19 ↔ A39  (sheet)
  - Y20 ↔ L28  (sheet)
  - … +20 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=18 · exposed=22 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=208 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=114 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1366 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
