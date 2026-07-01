# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1NXB\sequence\1NXB.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1NXB\seeds\seed_9\1NXB.pdb`
- residues: 60
- mode: oracle
- ca_rmsd: 4.469 A
- tm_score_ca_ordered: 0.43647674534244457
- heavy_atom_rmsd: 5.154 A
- sidechain_heavy_atom_rmsd: 5.735 A
- **all-atom quality (honest):** heavy 5.154 A, sidechain 5.735 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 4/4
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/55 (0.0)
- lj_severe: 0
- lj_near: 9
- distogram_pairs: 546
- bin_accuracy: 0.608

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_window_topology_regression tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.469215524328072
- ga_delta_rmsd: 2.541711246776658  ga_fitness_mode: energy
- pre_local_rmsd: 4.471423420893712  localized_anchor_rmsd: 4.4692129878625915

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** P43-N60 → 37 conflicts (88%); C23 → 5 conflicts (12%)
- explained: 42/42 conflicts by 2 root cause(s)
- metrics: hubs=12 (frac 0.2), conflicts/hub=3.5, max_incompat=5.79Å, chain_span=0.667
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): P43-N60 + C23 — explain ~42/42 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I49** — severity 18.62, 8 conflict(s); suspect input ~`P43` (group: push_out)
  - push-out (wants farther): S56@23.4Å(now 18.1,conf 0.91), C59@19.2Å(now 14.8,conf 0.56)
  - P43↔S56: targets 10.9/23.4Å but partners are 7.5Å apart → too_close_together by 4.9Å
  - T44↔S56: targets 9.1/23.4Å but partners are 10.8Å apart → too_close_together by 3.5Å
  - C54↔S56: targets 16.9/23.4Å but partners are 3.3Å apart → too_close_together by 3.1Å
- **P47** — severity 13.61, 8 conflict(s); suspect input ~`V58` (group: pull_in)
  - pull-in (wants closer): R32@18.2Å(now 24.5,conf 0.55)
  - push-out (wants farther): S52@13.0Å(now 10.5,conf 1.00), C54@19.2Å(now 16.5,conf 0.82), C2@23.3Å(now 20.4,conf 0.76), V58@26.3Å(now 21.0,conf 0.74), N60@20.4Å(now 16.7,conf 0.59)
  - P43↔V58: targets 11.0/26.3Å but partners are 11.1Å apart → too_close_together by 4.1Å
  - P43↔C54: targets 11.0/19.2Å but partners are 4.7Å apart → too_close_together by 3.5Å
  - V58↔T44: targets 26.3/9.6Å but partners are 14.4Å apart → too_close_together by 2.2Å
- **V58** — severity 9.07, 5 conflict(s); suspect input ~`P43` (group: pull_in)
  - pull-in (wants closer): E55@7.4Å(now 11.2,conf 0.79)
  - push-out (wants farther): P47@26.3Å(now 21.0,conf 0.74), P43@17.3Å(now 11.1,conf 0.55)
  - E55↔Q11: targets 7.4/10.3Å but partners are 22.5Å apart → too_far_apart by 4.7Å
  - S52↔P47: targets 13.0/26.3Å but partners are 10.5Å apart → too_close_together by 2.8Å
  - C54↔P43: targets 9.0/17.3Å but partners are 4.7Å apart → too_close_together by 3.6Å
- **F31** — severity 8.42, 5 conflict(s); suspect input ~`C23` (group: push_out)
  - pull-in (wants closer): E55@27.5Å(now 30.0,conf 1.00), G48@13.5Å(now 20.5,conf 0.55)
  - push-out (wants farther): C23@27.0Å(now 23.8,conf 0.84), C53@25.4Å(now 22.2,conf 0.70)
  - E37↔C23: targets 15.1/27.0Å but partners are 9.3Å apart → too_close_together by 2.5Å
  - C23↔R38: targets 27.0/18.0Å but partners are 6.6Å apart → too_close_together by 2.4Å
  - I36↔C23: targets 13.0/27.0Å but partners are 12.0Å apart → too_close_together by 2.0Å
- **K46** — severity 7.74, 4 conflict(s); suspect input ~`E57` (group: pull_in)
  - pull-in (wants closer): T34@15.8Å(now 18.9,conf 0.55)
  - push-out (wants farther): E57@23.4Å(now 17.0,conf 0.76), S52@10.0Å(now 6.7,conf 0.72), C42@11.1Å(now 8.5,conf 0.55)
  - E57↔P43: targets 23.4/8.1Å but partners are 9.6Å apart → too_close_together by 5.8Å
  - G41↔E57: targets 14.9/23.4Å but partners are 5.9Å apart → too_close_together by 2.6Å
  - E57↔S52: targets 23.4/10.0Å but partners are 11.5Å apart → too_close_together by 1.9Å
- **E57** — severity 4.01, 3 conflict(s); suspect input ~`K46` (group: pull_in)
  - pull-in (wants closer): S8@17.0Å(now 19.5,conf 0.55)
  - push-out (wants farther): S52@15.0Å(now 11.5,conf 1.00), C54@9.0Å(now 6.0,conf 1.00), K46@23.4Å(now 17.0,conf 0.76), L51@17.6Å(now 14.7,conf 0.55)
  - C54↔K46: targets 9.0/23.4Å but partners are 12.2Å apart → too_close_together by 2.2Å
  - S52↔K46: targets 15.0/23.4Å but partners are 6.7Å apart → too_close_together by 1.8Å
  - K46↔N60: targets 23.4/8.4Å but partners are 13.2Å apart → too_close_together by 1.8Å

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=26 · 3-10(G)=8 · coil(C)=8

```
CCGGEEHCECEEEEEGCHHCEEGGHEEEEEHECEEEEEEHEHHHHGCGGHHHHHHEEHHE
```

## Backbone H-bond Network

- total=47 · helix(i→i+4)=4 · sheet=43
  - C40 ↔ T44  (helix)
  - K50 ↔ C54  (helix)
  - C54 ↔ V58  (helix)
  - E55 ↔ C59  (helix)
  - Q5 ↔ Q11  (sheet)
  - Q5 ↔ T12  (sheet)
  - Q5 ↔ T13  (sheet)
  - Q5 ↔ K14  (sheet)
  - H6 ↔ Q11  (sheet)
  - H6 ↔ T12  (sheet)
  - H6 ↔ T13  (sheet)
  - H6 ↔ K26  (sheet)
  - T15 ↔ S21  (sheet)
  - S21 ↔ R38  (sheet)
  - S21 ↔ G39  (sheet)
  - S21 ↔ G41  (sheet)
  - S22 ↔ R38  (sheet)
  - S22 ↔ G39  (sheet)
  - S22 ↔ G41  (sheet)
  - K26 ↔ T34  (sheet)
  - … +27 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=24 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=249 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=167 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.1449 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=9 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=4: C2–C23, C16–C40, C42–C53, C54–C59

## Side-chain Rotamers (χ1/χ2)

- 55 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
