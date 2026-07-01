# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1NXB\sequence\1NXB.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1NXB\seeds\seed_2\1NXB.pdb`
- residues: 60
- mode: oracle
- ca_rmsd: 6.768 A
- tm_score_ca_ordered: 0.23589453198821514
- heavy_atom_rmsd: 7.969 A
- sidechain_heavy_atom_rmsd: 9.051 A
- **all-atom quality (honest):** heavy 7.969 A, sidechain 9.051 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 4/4
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/55 (0.0)
- lj_severe: 0
- lj_near: 30
- distogram_pairs: 551
- bin_accuracy: 0.385

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=domain_block reason=accepted tested=39
- rigid_domain_reconvergence: applied=True accepted=8 rmsd=6.861025054220353 -> 6.045636045898808 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.768324617958433
- ga_delta_rmsd: -0.6950485417533221  ga_fitness_mode: energy
- pre_local_rmsd: 6.7717690121258265  localized_anchor_rmsd: 6.768294559828944

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** S8-T13 → 193 conflicts (53%); I36-T44 → 73 conflicts (20%); V58-N60 → 39 conflicts (11%)
- explained: 305/367 conflicts by 3 root cause(s)
- metrics: hubs=50 (frac 0.833), conflicts/hub=7.3, max_incompat=11.6Å, chain_span=0.983
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): S8-T13 + I36-T44 + V58-N60 — explain ~305/367 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Q9** — severity 73.97, 26 conflict(s); suspect input ~`N4` (group: push_out)
  - push-out (wants farther): G19@27.3Å(now 17.6,conf 0.93), E20@23.5Å(now 13.9,conf 0.76), T13@11.8Å(now 9.2,conf 0.69), P43@21.3Å(now 14.0,conf 0.60), S22@21.0Å(now 16.4,conf 0.60), C23@17.5Å(now 14.2,conf 0.55), Q27@14.2Å(now 8.1,conf 0.55), I36@10.1Å(now 6.2,conf 0.55)
  - E20↔Q5: targets 23.5/7.8Å but partners are 7.4Å apart → too_close_together by 8.3Å
  - G19↔Q5: targets 27.3/7.8Å but partners are 11.3Å apart → too_close_together by 8.2Å
  - G19↔F3: targets 27.3/11.1Å but partners are 11.2Å apart → too_close_together by 5.0Å
- **Q11** — severity 58.88, 27 conflict(s); suspect input ~`P18` (group: push_out)
  - push-out (wants farther): S17@19.0Å(now 8.6,conf 1.00), R38@11.0Å(now 7.2,conf 0.99), P18@23.4Å(now 12.7,conf 0.91), Q5@6.8Å(now 3.9,conf 0.82), T44@23.9Å(now 18.8,conf 0.74), G48@24.8Å(now 20.2,conf 0.70), I49@22.5Å(now 18.4,conf 0.68), P43@20.8Å(now 14.2,conf 0.59), G41@17.6Å(now 10.7,conf 0.55), C16@15.5Å(now 11.6,conf 0.55)
  - P18↔V58: targets 23.4/10.3Å but partners are 3.7Å apart → too_close_together by 9.4Å
  - N4↔P18: targets 7.0/23.4Å but partners are 11.6Å apart → too_close_together by 4.8Å
  - N4↔P43: targets 7.0/20.8Å but partners are 7.3Å apart → too_close_together by 6.5Å
- **P43** — severity 55.05, 24 conflict(s); suspect input ~`P10` (group: push_out)
  - push-out (wants farther): K50@10.6Å(now 8.0,conf 0.79), P10@22.8Å(now 13.0,conf 0.71), Q9@21.3Å(now 14.0,conf 0.60), Q11@20.8Å(now 14.2,conf 0.59), S8@19.3Å(now 12.4,conf 0.57), S7@17.7Å(now 13.3,conf 0.55), V58@17.3Å(now 12.2,conf 0.55), H6@16.1Å(now 8.6,conf 0.55), N4@14.0Å(now 7.3,conf 0.55)
  - R38↔P10: targets 10.6/22.8Å but partners are 3.8Å apart → too_close_together by 8.4Å
  - G39↔P10: targets 10.0/22.8Å but partners are 5.9Å apart → too_close_together by 6.8Å
  - G39↔Q11: targets 10.0/20.8Å but partners are 5.4Å apart → too_close_together by 5.4Å
- **P10** — severity 51.61, 17 conflict(s); suspect input ~`P43` (group: push_out)
  - push-out (wants farther): T13@11.0Å(now 6.4,conf 1.00), T15@17.0Å(now 13.4,conf 0.99), C16@19.0Å(now 14.2,conf 0.99), G19@27.1Å(now 16.5,conf 0.87), S7@9.2Å(now 5.8,conf 0.82), Q5@8.6Å(now 5.9,conf 0.79), K14@13.4Å(now 10.8,conf 0.79), P43@22.8Å(now 13.0,conf 0.71), S17@22.1Å(now 13.2,conf 0.64), G41@20.3Å(now 12.2,conf 0.59), S29@19.7Å(now 14.8,conf 0.57), K26@17.1Å(now 11.2,conf 0.55), I35@14.4Å(now 10.2,conf 0.55)
  - G19↔Q5: targets 27.1/8.6Å but partners are 11.3Å apart → too_close_together by 7.2Å
  - G19↔N4: targets 27.1/10.6Å but partners are 10.1Å apart → too_close_together by 6.5Å
  - P43↔F3: targets 22.8/10.1Å but partners are 5.9Å apart → too_close_together by 6.7Å
- **I49** — severity 36.94, 14 conflict(s); suspect input ~`T13` (group: push_out)
  - push-out (wants farther): T44@10.0Å(now 6.4,conf 0.72), Q11@22.5Å(now 18.4,conf 0.68), T13@22.4Å(now 10.5,conf 0.66)
  - K46↔T13: targets 5.2/22.4Å but partners are 7.3Å apart → too_close_together by 9.8Å
  - T13↔V45: targets 22.4/6.1Å but partners are 4.7Å apart → too_close_together by 11.6Å
  - T13↔C42: targets 22.4/12.5Å but partners are 3.5Å apart → too_close_together by 6.3Å
- **T44** — severity 34.67, 18 conflict(s); suspect input ~`T13` (group: push_out)
  - push-out (wants farther): K50@11.0Å(now 4.5,conf 0.99), Q11@23.9Å(now 18.8,conf 0.74), I49@10.0Å(now 6.4,conf 0.72), G33@22.2Å(now 19.1,conf 0.65), T13@21.4Å(now 10.3,conf 0.61), S7@20.1Å(now 17.3,conf 0.58), Q5@19.8Å(now 15.5,conf 0.58), L51@8.9Å(now 3.8,conf 0.55), C53@10.7Å(now 7.8,conf 0.55), N60@16.4Å(now 12.2,conf 0.55)
  - Q11↔G39: targets 23.9/14.0Å but partners are 5.4Å apart → too_close_together by 4.5Å
  - T13↔L51: targets 21.4/8.9Å but partners are 7.0Å apart → too_close_together by 5.5Å
  - C40↔Q11: targets 13.0/23.9Å but partners are 7.1Å apart → too_close_together by 3.8Å

## Secondary Structure (DSSP-like)

- helix(H)=30 · strand(E)=19 · 3-10(G)=6 · coil(C)=5

```
CEEEHHHHHHHHHEHEHHHECEEEGGHHEGHHHHHCEEEEHHGHGEEHCEGECHHHHHHE
```

## Backbone H-bond Network

- total=64 · helix(i→i+4)=12 · sheet=52
  - Q5 ↔ Q9  (helix)
  - H6 ↔ P10  (helix)
  - S7 ↔ Q11  (helix)
  - S8 ↔ T12  (helix)
  - Q9 ↔ T13  (helix)
  - T13 ↔ S17  (helix)
  - Q27 ↔ F31  (helix)
  - W28 ↔ R32  (helix)
  - F31 ↔ I35  (helix)
  - T44 ↔ G48  (helix)
  - C54 ↔ V58  (helix)
  - E55 ↔ C59  (helix)
  - C2 ↔ C16  (sheet)
  - C2 ↔ E20  (sheet)
  - C2 ↔ S22  (sheet)
  - F3 ↔ K14  (sheet)
  - F3 ↔ C16  (sheet)
  - F3 ↔ E20  (sheet)
  - F3 ↔ S22  (sheet)
  - F3 ↔ C23  (sheet)
  - … +44 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=33 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=343 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=252 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.5008 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=30 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=4: C2–C23, C16–C40, C42–C53, C54–C59

## Side-chain Rotamers (χ1/χ2)

- 55 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
