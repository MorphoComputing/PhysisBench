# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1NXB\sequence\1NXB.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1NXB\seeds\seed_1\1NXB.pdb`
- residues: 60
- mode: oracle
- ca_rmsd: 4.283 A
- tm_score_ca_ordered: 0.40609122507066703
- heavy_atom_rmsd: 5.763 A
- sidechain_heavy_atom_rmsd: 7.002 A
- **all-atom quality (honest):** heavy 5.763 A, sidechain 7.002 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 4/4
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/55 (0.0)
- lj_severe: 0
- lj_near: 12
- distogram_pairs: 546
- bin_accuracy: 0.557

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=residue_block reason=accepted tested=45
- rigid_domain_reconvergence: applied=True accepted=11 rmsd=7.598363123596373 -> 6.372056745485264 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.283184867640285
- ga_delta_rmsd: 1.5204101686321199  ga_fitness_mode: energy
- pre_local_rmsd: 4.3041257926892165  localized_anchor_rmsd: 4.28316488026291

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E57-V58 → 35 conflicts (38%); S29-F31 → 25 conflicts (28%); F3 → 5 conflicts (6%)
- explained: 65/91 conflicts by 3 root cause(s)
- metrics: hubs=29 (frac 0.483), conflicts/hub=3.1, max_incompat=6.43Å, chain_span=0.967
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E57-V58 + S29-F31 + F3 — explain ~65/91 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F31** — severity 22.10, 8 conflict(s); suspect input ~`I1` (group: pull_in)
  - pull-in (wants closer): S21@27.5Å(now 30.5,conf 1.00), E55@27.5Å(now 30.8,conf 1.00), G48@13.5Å(now 19.0,conf 0.55)
  - push-out (wants farther): I1@27.5Å(now 22.3,conf 1.00), K14@27.5Å(now 23.7,conf 0.98), C23@27.0Å(now 24.1,conf 0.84), Q11@23.9Å(now 20.3,conf 0.74)
  - E37↔I1: targets 15.0/27.5Å but partners are 8.3Å apart → too_close_together by 4.2Å
  - I1↔T34: targets 27.5/7.0Å but partners are 16.6Å apart → too_close_together by 3.9Å
  - I36↔I1: targets 13.0/27.5Å but partners are 11.2Å apart → too_close_together by 3.3Å
- **K46** — severity 20.09, 8 conflict(s); suspect input ~`E57` (group: push_out)
  - push-out (wants farther): C53@13.0Å(now 10.2,conf 0.99), E57@23.4Å(now 16.1,conf 0.76), S52@10.4Å(now 7.8,conf 0.69)
  - E57↔G41: targets 23.4/14.0Å but partners are 3.8Å apart → too_close_together by 5.7Å
  - E57↔P43: targets 23.4/8.1Å but partners are 8.9Å apart → too_close_together by 6.4Å
  - C53↔E57: targets 13.0/23.4Å but partners are 6.2Å apart → too_close_together by 4.2Å
- **S29** — severity 13.87, 7 conflict(s); suspect input ~`F3` (group: push_out)
  - push-out (wants farther): P10@19.7Å(now 16.2,conf 0.57), F3@19.6Å(now 14.6,conf 0.57), S7@11.0Å(now 7.2,conf 0.55), Q5@16.3Å(now 13.4,conf 0.55)
  - I35↔F3: targets 5.0/19.6Å but partners are 9.6Å apart → too_close_together by 4.9Å
  - I36↔F3: targets 8.9/19.6Å but partners are 6.1Å apart → too_close_together by 4.6Å
  - F3↔E37: targets 19.6/11.1Å but partners are 4.3Å apart → too_close_together by 4.2Å
- **Q11** — severity 12.04, 6 conflict(s); suspect input ~`V58` (group: push_out)
  - pull-in (wants closer): C54@17.7Å(now 20.4,conf 0.55), V58@10.3Å(now 15.0,conf 0.55)
  - push-out (wants farther): F31@23.9Å(now 20.3,conf 0.74)
  - H6↔F31: targets 9.0/23.9Å but partners are 11.4Å apart → too_close_together by 3.5Å
  - P18↔V58: targets 22.9/10.3Å but partners are 8.3Å apart → too_close_together by 4.4Å
  - F31↔S8: targets 23.9/6.6Å but partners are 13.7Å apart → too_close_together by 3.6Å
- **P47** — severity 11.83, 7 conflict(s); suspect input ~`V58` (group: pull_in)
  - pull-in (wants closer): R32@18.2Å(now 21.0,conf 0.55)
  - push-out (wants farther): C2@23.3Å(now 19.9,conf 0.76), V58@26.3Å(now 22.4,conf 0.74)
  - P43↔V58: targets 11.0/26.3Å but partners are 11.8Å apart → too_close_together by 3.5Å
  - G41↔V58: targets 17.1/26.3Å but partners are 6.8Å apart → too_close_together by 2.3Å
  - S52↔V58: targets 13.0/26.3Å but partners are 11.0Å apart → too_close_together by 2.3Å
- **K50** — severity 10.14, 5 conflict(s); suspect input ~`C53` (group: push_out)
  - push-out (wants farther): E57@21.0Å(now 16.8,conf 0.99), T12@20.6Å(now 17.6,conf 0.59)
  - C53↔E57: targets 11.0/21.0Å but partners are 6.2Å apart → too_close_together by 3.8Å
  - E55↔E57: targets 17.0/21.0Å but partners are 2.0Å apart → too_close_together by 1.9Å
  - C54↔E57: targets 15.0/21.0Å but partners are 4.4Å apart → too_close_together by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=24 · strand(E)=26 · 3-10(G)=4 · coil(C)=6

```
CHHEEEHEEEEHCEEGEGHEEGEEEEEHHEHHHCCGEEEHHHHHHEHHHCEECEHHHHHE
```

## Backbone H-bond Network

- total=74 · helix(i→i+4)=6 · sheet=68
  - F3 ↔ S7  (helix)
  - W28 ↔ R32  (helix)
  - C40 ↔ T44  (helix)
  - P43 ↔ P47  (helix)
  - T44 ↔ G48  (helix)
  - E55 ↔ C59  (helix)
  - N4 ↔ Q9  (sheet)
  - N4 ↔ P10  (sheet)
  - N4 ↔ Q11  (sheet)
  - N4 ↔ K14  (sheet)
  - N4 ↔ T15  (sheet)
  - N4 ↔ C23  (sheet)
  - N4 ↔ Y24  (sheet)
  - Q5 ↔ P10  (sheet)
  - Q5 ↔ Q11  (sheet)
  - Q5 ↔ K14  (sheet)
  - Q5 ↔ T15  (sheet)
  - Q5 ↔ C23  (sheet)
  - Q5 ↔ Y24  (sheet)
  - Q5 ↔ H25  (sheet)
  - … +54 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=18 · exposed=18 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=279 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=196 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.1414 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=12 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=4: C2–C23, C16–C40, C42–C53, C54–C59

## Side-chain Rotamers (χ1/χ2)

- 55 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
