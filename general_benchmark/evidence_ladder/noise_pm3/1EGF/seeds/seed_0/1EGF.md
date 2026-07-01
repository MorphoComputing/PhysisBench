# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1EGF\sequence\1EGF.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1EGF\seeds\seed_0\1EGF.pdb`
- residues: 51
- mode: oracle
- ca_rmsd: 2.284 A
- tm_score_ca_ordered: 0.6172745830102029
- heavy_atom_rmsd: 4.488 A
- sidechain_heavy_atom_rmsd: 5.730 A
- **all-atom quality (honest):** heavy 4.488 A, sidechain 5.730 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 1176
- bin_accuracy: 0.342

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.283555755781552
- ga_delta_rmsd: 0.5710814483321531  ga_fitness_mode: energy
- pre_local_rmsd: 2.293496766006107  localized_anchor_rmsd: 2.2835762485622073

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** Y28-C32 → 353 conflicts (42%); S8-G11 → 128 conflicts (15%); G35-S37 → 85 conflicts (10%)
- explained: 566/831 conflicts by 3 root cause(s)
- metrics: hubs=51 (frac 1.0), conflicts/hub=16.3, max_incompat=10.89Å, chain_span=0.98
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): Y28-C32 + S8-G11 + G35-S37 — explain ~566/831 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C41** — severity 47.59, 55 conflict(s); suspect input ~`H21` (group: pull_in)
  - pull-in (wants closer): D10@8.4Å(now 12.8,conf 0.20), H21@7.1Å(now 14.5,conf 0.26), R47@8.3Å(now 13.0,conf 0.21), M20@9.3Å(now 13.0,conf 0.17), G11@6.5Å(now 10.6,conf 0.30)
  - push-out (wants farther): S24@22.4Å(now 18.2,conf 0.33), D26@21.6Å(now 18.9,conf 0.29), C13@9.9Å(now 6.0,conf 0.16), P3@22.6Å(now 17.7,conf 0.34), G16@10.2Å(now 6.2,conf 0.15), S27@17.8Å(now 14.9,conf 0.17)
  - P3↔H21: targets 22.6/7.1Å but partners are 4.6Å apart → too_close_together by 10.8Å
  - H21↔G35: targets 7.1/6.4Å but partners are 21.5Å apart → too_far_apart by 7.9Å
  - D26↔H21: targets 21.6/7.1Å but partners are 7.2Å apart → too_close_together by 7.3Å
- **H21** — severity 30.19, 32 conflict(s); suspect input ~`C41` (group: pull_in)
  - pull-in (wants closer): G35@18.2Å(now 21.5,conf 0.18), C41@7.1Å(now 14.5,conf 0.26), S24@5.9Å(now 10.7,conf 0.35)
  - push-out (wants farther): D45@24.9Å(now 21.1,conf 0.51), G4@8.1Å(now 4.8,conf 0.22), Y2@9.6Å(now 4.5,conf 0.17), P3@9.9Å(now 4.6,conf 0.16), T29@9.2Å(now 5.9,conf 0.18), N15@22.3Å(now 17.6,conf 0.32), G38@20.6Å(now 13.3,conf 0.25)
  - N15↔C41: targets 22.3/7.1Å but partners are 5.3Å apart → too_close_together by 9.8Å
  - D45↔C41: targets 24.9/7.1Å but partners are 8.9Å apart → too_close_together by 8.8Å
  - R44↔C41: targets 20.0/7.1Å but partners are 5.5Å apart → too_close_together by 7.4Å
- **C5** — severity 30.00, 35 conflict(s); suspect input ~`C32` (group: pull_in)
  - pull-in (wants closer): R47@20.2Å(now 23.1,conf 0.23), G16@9.3Å(now 13.8,conf 0.17), D26@8.3Å(now 12.0,conf 0.21), C32@7.8Å(now 14.6,conf 0.23), N31@8.4Å(now 11.6,conf 0.20)
  - push-out (wants farther): T43@22.1Å(now 19.0,conf 0.31), Y36@20.9Å(now 17.9,conf 0.26), V33@21.8Å(now 17.7,conf 0.30), S37@20.6Å(now 17.2,conf 0.25), Y9@8.8Å(now 5.4,conf 0.19), S8@7.8Å(now 4.9,conf 0.23)
  - V33↔C32: targets 21.8/7.8Å but partners are 3.7Å apart → too_close_together by 10.4Å
  - Y36↔C32: targets 20.9/7.8Å but partners are 4.8Å apart → too_close_together by 8.3Å
  - S37↔C32: targets 20.6/7.8Å but partners are 5.2Å apart → too_close_together by 7.7Å
- **N31** — severity 27.90, 39 conflict(s); suspect input ~`Y2` (group: pull_in)
  - pull-in (wants closer): Y2@9.0Å(now 14.7,conf 0.18), P3@9.7Å(now 13.0,conf 0.17), C5@8.4Å(now 11.6,conf 0.20)
  - push-out (wants farther): V18@8.8Å(now 4.8,conf 0.19), S8@22.5Å(now 15.9,conf 0.33), L25@22.3Å(now 18.3,conf 0.32), Y9@18.7Å(now 13.3,conf 0.19), D10@19.8Å(now 13.7,conf 0.22), E23@19.6Å(now 16.4,conf 0.22), N15@16.8Å(now 9.3,conf 0.16)
  - S8↔C5: targets 22.5/8.4Å but partners are 4.9Å apart → too_close_together by 9.2Å
  - C13↔D10: targets 6.3/19.8Å but partners are 7.6Å apart → too_close_together by 5.9Å
  - S8↔C13: targets 22.5/6.3Å but partners are 12.2Å apart → too_close_together by 4.0Å
- **G35** — severity 24.34, 30 conflict(s); suspect input ~`C30` (group: push_out)
  - pull-in (wants closer): S8@22.4Å(now 25.1,conf 0.33), Y2@21.1Å(now 25.1,conf 0.27), P6@19.9Å(now 23.7,conf 0.23), I22@18.5Å(now 21.2,conf 0.19), H21@18.2Å(now 21.5,conf 0.18), W48@6.3Å(now 12.4,conf 0.32), E50@10.1Å(now 16.1,conf 0.16), C30@8.1Å(now 13.8,conf 0.22)
  - push-out (wants farther): R44@6.7Å(now 3.6,conf 0.29), C19@20.0Å(now 16.8,conf 0.23), T43@9.8Å(now 7.2,conf 0.16), L51@23.9Å(now 18.6,conf 0.42)
  - W48↔L51: targets 6.3/23.9Å but partners are 7.4Å apart → too_close_together by 10.2Å
  - E50↔L51: targets 10.1/23.9Å but partners are 3.0Å apart → too_close_together by 10.8Å
  - C19↔C30: targets 20.0/8.1Å but partners are 4.8Å apart → too_close_together by 7.2Å
- **S1** — severity 21.93, 29 conflict(s); suspect input ~`S8` (group: pull_in)
  - pull-in (wants closer): L14@17.7Å(now 20.2,conf 0.17), S8@10.2Å(now 15.1,conf 0.15), V18@9.5Å(now 15.0,conf 0.17)
  - push-out (wants farther): W48@22.7Å(now 20.0,conf 0.34), D10@21.7Å(now 19.0,conf 0.29), G11@24.2Å(now 17.1,conf 0.45), S7@19.2Å(now 16.1,conf 0.21), Y9@22.0Å(now 17.4,conf 0.30), P6@18.5Å(now 15.6,conf 0.19), G38@19.6Å(now 14.3,conf 0.22)
  - G11↔H21: targets 24.2/5.6Å but partners are 10.6Å apart → too_close_together by 8.0Å
  - Y9↔H21: targets 22.0/5.6Å but partners are 10.6Å apart → too_close_together by 5.8Å
  - D10↔H21: targets 21.7/5.6Å but partners are 12.2Å apart → too_close_together by 3.9Å

## Secondary Structure (DSSP-like)

- helix(H)=11 · strand(E)=22 · 3-10(G)=10 · coil(C)=8

```
CEGEEHHHECEECEHEECGECGHHHGGGGGEEGEHEEEEEHCHHECEGEEC
```

## Backbone H-bond Network

- total=74 · helix(i→i+4)=0 · sheet=74
  - Y2 ↔ M20  (sheet)
  - G4 ↔ Y9  (sheet)
  - G4 ↔ G11  (sheet)
  - G4 ↔ Y12  (sheet)
  - G4 ↔ M20  (sheet)
  - C5 ↔ G11  (sheet)
  - C5 ↔ Y12  (sheet)
  - C5 ↔ G17  (sheet)
  - C5 ↔ M20  (sheet)
  - Y9 ↔ L14  (sheet)
  - Y9 ↔ M20  (sheet)
  - G11 ↔ G16  (sheet)
  - G11 ↔ G17  (sheet)
  - G11 ↔ M20  (sheet)
  - G11 ↔ N31  (sheet)
  - Y12 ↔ G17  (sheet)
  - Y12 ↔ M20  (sheet)
  - Y12 ↔ N31  (sheet)
  - Y12 ↔ C32  (sheet)
  - L14 ↔ N31  (sheet)
  - … +54 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=14 · exposed=25 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=198 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=108 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.7042 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C19, C13–C30, C32–C41

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
