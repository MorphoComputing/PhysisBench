# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1NXB\sequence\1NXB.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1NXB\seeds\seed_6\1NXB.pdb`
- residues: 60
- mode: oracle
- ca_rmsd: 3.533 A
- tm_score_ca_ordered: 0.5415557556537925
- heavy_atom_rmsd: 4.932 A
- sidechain_heavy_atom_rmsd: 5.966 A
- **all-atom quality (honest):** heavy 4.932 A, sidechain 5.966 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 4/4
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/55 (0.0)
- lj_severe: 0
- lj_near: 15
- distogram_pairs: 546
- bin_accuracy: 0.654

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=30
- rigid_domain_reconvergence: applied=True accepted=6 rmsd=4.425695197988968 -> 3.992235732315858 A
- topology_reconvergence: applied=True accepted=2/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.5331390270487524
- ga_delta_rmsd: -1.1395998981248416  ga_fitness_mode: energy
- pre_local_rmsd: 3.533168563593598  localized_anchor_rmsd: 3.533168563593598

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E57-V58 → 11 conflicts (37%); F31 → 8 conflicts (27%); T34 → 3 conflicts (10%)
- explained: 22/30 conflicts by 3 root cause(s)
- metrics: hubs=15 (frac 0.25), conflicts/hub=2.0, max_incompat=4.04Å, chain_span=0.95
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E57-V58 + F31 + T34 — explain ~22/30 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F31** — severity 9.80, 6 conflict(s); suspect input ~`C23` (group: push_out)
  - pull-in (wants closer): S21@27.5Å(now 31.3,conf 1.00), S17@27.5Å(now 31.2,conf 1.00), E55@27.5Å(now 30.5,conf 1.00)
  - push-out (wants farther): K14@27.5Å(now 24.9,conf 0.98), C23@27.0Å(now 24.1,conf 0.84), Q11@23.9Å(now 19.4,conf 0.74)
  - T34↔Q11: targets 7.1/23.9Å but partners are 14.2Å apart → too_close_together by 2.6Å
  - E37↔C23: targets 15.0/27.0Å but partners are 9.8Å apart → too_close_together by 2.1Å
  - C23↔K26: targets 27.0/15.4Å but partners are 9.4Å apart → too_close_together by 2.1Å
- **C2** — severity 6.10, 5 conflict(s); suspect input ~`E57` (group: pull_in)
  - pull-in (wants closer): E57@6.0Å(now 8.7,conf 0.55)
  - push-out (wants farther): W28@19.3Å(now 16.6,conf 0.56), E37@11.4Å(now 8.2,conf 0.55)
  - S8↔E57: targets 13.1/6.0Å but partners are 22.0Å apart → too_far_apart by 2.8Å
  - Q9↔E57: targets 15.0/6.0Å but partners are 23.9Å apart → too_far_apart by 2.8Å
  - Q5↔E57: targets 9.4/6.0Å but partners are 17.4Å apart → too_far_apart by 1.9Å
- **Q11** — severity 5.86, 5 conflict(s); suspect input ~`V58` (group: pull_in)
  - pull-in (wants closer): C54@17.7Å(now 22.0,conf 0.55), V58@10.3Å(now 16.1,conf 0.55)
  - push-out (wants farther): F31@23.9Å(now 19.4,conf 0.74), T34@17.9Å(now 14.2,conf 0.55)
  - P18↔V58: targets 23.5/10.3Å but partners are 10.2Å apart → too_close_together by 3.0Å
  - S8↔V58: targets 6.6/10.3Å but partners are 19.3Å apart → too_far_apart by 2.5Å
  - H6↔T34: targets 8.8/17.9Å but partners are 7.2Å apart → too_close_together by 1.9Å
- **S8** — severity 4.27, 2 conflict(s); suspect input ~`F3` (group: push_out)
  - pull-in (wants closer): E57@17.0Å(now 22.0,conf 0.55), S52@15.7Å(now 18.9,conf 0.55)
  - push-out (wants farther): T15@19.0Å(now 16.3,conf 0.99)
  - T15↔F3: targets 19.0/10.9Å but partners are 5.2Å apart → too_close_together by 2.9Å
  - T15↔C2: targets 19.0/13.1Å but partners are 4.0Å apart → too_close_together by 1.8Å
- **V58** — severity 2.89, 2 conflict(s); suspect input ~`Q11` (group: pull_in)
  - pull-in (wants closer): S7@15.0Å(now 20.5,conf 0.55), Q11@10.3Å(now 16.1,conf 0.55)
  - E55↔Q11: targets 8.9/10.3Å but partners are 22.9Å apart → too_far_apart by 3.7Å
  - R32↔S7: targets 27.3/15.0Å but partners are 10.7Å apart → too_close_together by 1.6Å
- **H25** — severity 2.20, 1 conflict(s); suspect input ~`S7` (group: pull_in)
  - pull-in (wants closer): C54@8.9Å(now 12.0,conf 0.55)
  - push-out (wants farther): R32@18.9Å(now 16.4,conf 0.91)
  - C54↔S7: targets 8.9/9.7Å but partners are 22.6Å apart → too_far_apart by 4.0Å

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=28 · 3-10(G)=5 · coil(C)=11

```
CHHEEEHCHCEEEEHHCHCEGECCEECEEEHEGHECEEEHHHEHEEGHEGECCEGEEHHE
```

## Backbone H-bond Network

- total=68 · helix(i→i+4)=3 · sheet=65
  - F3 ↔ S7  (helix)
  - C40 ↔ T44  (helix)
  - T44 ↔ G48  (helix)
  - N4 ↔ Q11  (sheet)
  - N4 ↔ T12  (sheet)
  - N4 ↔ T13  (sheet)
  - N4 ↔ K14  (sheet)
  - Q5 ↔ Q11  (sheet)
  - Q5 ↔ T12  (sheet)
  - Q5 ↔ T13  (sheet)
  - Q5 ↔ K14  (sheet)
  - Q5 ↔ H25  (sheet)
  - H6 ↔ Q11  (sheet)
  - H6 ↔ T12  (sheet)
  - H6 ↔ T13  (sheet)
  - H6 ↔ H25  (sheet)
  - H6 ↔ K26  (sheet)
  - T12 ↔ H25  (sheet)
  - T13 ↔ H25  (sheet)
  - K14 ↔ E20  (sheet)
  - … +48 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=21 · exposed=22 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=249 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=163 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5072 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=15 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=4: C2–C23, C16–C40, C42–C53, C54–C59

## Side-chain Rotamers (χ1/χ2)

- 55 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
